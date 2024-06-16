resource "kubernetes_namespace" "demo-cluster" {
  metadata {
    name = "demo-cluster"
  }
  depends_on = [google_container_node_pool.primary_nodes]
}
