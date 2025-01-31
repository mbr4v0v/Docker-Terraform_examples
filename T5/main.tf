terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull the Docker image for a simple Flask app
resource "docker_image" "flask_app" {
  name         = "adekhemie/simple-webapp-flask"
  keep_locally = false
}

# Create a Docker container running the Flask app
resource "docker_container" "flask_app" {
  image = docker_image.flask_app.image_id
  name  = "flask-app-container"

  ports {
    internal = 5000 # Flask app listens on port 5000 inside the container
    external = 8080 # Map to port 8080 on the host
  }

  env = [
    "FLASK_ENV=development", # Set environment variable for Flask
    "DEBUG=1"
  ]
}
