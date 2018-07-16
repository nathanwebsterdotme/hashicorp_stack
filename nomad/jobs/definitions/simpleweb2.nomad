job "simpleweb2" {
  datacenters = ["dc1"]
  type = "service"

  group "simpleweb2" {
    count = 5

    update {
      stagger          = "5s"
      max_parallel     = 1
      min_healthy_time = "10s"
      healthy_deadline = "2m"
      auto_revert      = true
    }

    task "simpleweb2" {
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
        name = "simpleweb2"
        tags = [
          "traefik.frontend.rule=Host:simpleweb2.com",
          "traefik.frontend.rule=Host:simpleweb2.io",
          "traefik.enable=true",
          "simpleweb2"
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
