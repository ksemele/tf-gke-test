resource "kubernetes_namespace" "this-is-demo-cluster" {
  metadata {
    name = "this-is-demo-cluster"
  }
  depends_on = [module.gke]
}
