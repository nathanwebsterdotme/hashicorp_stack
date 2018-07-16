job "simpleweb" {
  datacenters = ["dc1"]
  type = "service"

  group "simpleweb" {
    count = 5

    update {
      stagger          = "5s"
      max_parallel     = 1
      min_healthy_time = "10s"
      healthy_deadline = "2m"
      auto_revert      = true
    }

    task "simpleweb" {
      driver = "docker"

      config {
        image = "nginxdemos/hello"

        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 500
        memory = 128

        network {
          mbits = 1
          port "http" {}
        }
      }

      service {
        port = "http"
        name = "simpleweb"
        tags = [
          "traefik.frontend.rule=Host:simpleweb.com",
          "traefik.frontend.rule=Host:simpleweb.io",
          "traefik.enable=true",
          "simpleweb"
        ]

        check {
          type     = "tcp"
          port     = "http"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
