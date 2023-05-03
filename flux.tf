resource "kubernetes_namespace" "flux-system" {
  metadata {
    name = "flux-system"
  }
}