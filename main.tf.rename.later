terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = "./bold-physics-383802-3ca5961d947d.json"
  project     = "bold-physics-383802"
  region      = "us-central1"
}

#i############
#terraform {
#  required_providers {
#    kubernetes = {
#      source  = "hashicorp/kubernetes"
#      version = ">= 2.0.0"
#    }
#  }
#}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_deployment" "test" {
  metadata {
    name      = "appmaven002"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "appmaven002"
      }
    }
    template {
      metadata {
        labels = {
          app = "appmaven002"
        }
      }
      spec {
        container {
          image = "apotieri/app_maven_001"
          name  = "appmaven002"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
