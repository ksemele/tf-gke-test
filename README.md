# How to use

1. Create *.tfvars file with a few variables
```
project          = "gcp-project"
region           = "europe-west1"
environment_name = "demo"
```

2. Create cluster
```
terraform init
terraform apply
```

3. Configure kubeconfig for new cluster
```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region) --project $(terraform output -raw project)
```

4. Destroy all resources
```
terraform destroy -target 'kubernetes_namespace.flux-system'
terraform destroy -target 'google_container_node_pool.primary_nodes'
terraform destroy -target 'google_container_cluster.primary'
terraform destroy -target 'google_compute_subnetwork.subnet'
terraform destroy -target 'google_compute_network.vpc'
terraform destroy -target 'data.google_client_config.primary'
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.4.2 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~>4.62.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~>2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.62.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.primary_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [kubernetes_namespace.flux-system](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [google_client_config.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | n/a | `string` | `"demo"` | no |
| <a name="input_gke_num_nodes"></a> [gke\_num\_nodes](#input\_gke\_num\_nodes) | number of gke nodes | `number` | `1` | no |
| <a name="input_project"></a> [project](#input\_project) | Google Project to create resources in | `string` | `"demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | `"us-central1"` | no |
| <a name="input_vpc_host_project"></a> [vpc\_host\_project](#input\_vpc\_host\_project) | Host Project where virtual network exists | `string` | `"demo"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_cluster_host"></a> [kubernetes\_cluster\_host](#output\_kubernetes\_cluster\_host) | GKE Cluster Host |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | GKE Cluster Name |
| <a name="output_project"></a> [project](#output\_project) | GCloud Project ID |
| <a name="output_region"></a> [region](#output\_region) | GCloud Region |
<!-- END_TF_DOCS -->
