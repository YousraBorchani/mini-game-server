provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

/*provider "kubectl" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}*/


terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.9.0"
    }
    /*kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }*/
  }
}

# Deploy kubernetes manifest on terraform using kubectl 

/*data "kubectl_path_documents" "docs" {
  pattern = "./manifests/udp*.yaml"
}

resource "kubectl_manifest" "deploy_server" {
  for_each  = toset(data.kubectl_path_documents.docs.documents)
  yaml_body = each.value
}
*/
