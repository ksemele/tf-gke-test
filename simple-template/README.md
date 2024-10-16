# simple-template

## What is created ty thah template

This example is using local state.
You need an empty google project for tests.

1. VPC network with one subnet
2. GKE cluster with an external endpoint and services network (be careful with that!)
3. Workload nodepool with one node
3. Namespace `this-is-demo-cluster`

## How to use the code

1. Create a `terraform.tfvars` file with a few variables

```shell
project          = "your-gcp-project"
```
`region`, `zone` and `environment_name` are optional

2. Create the cluster

All commands will be applied via Terraform 1.8.0 or via OpenTofu, the same version.
I use alias `t` for the commands.

```shell
t init
t apply
```

3. Get the credentials for the new cluster (configure kubeconfig)

You can see all useful commands and links in the output:

```shell
t output
```

There is a manual command:

```shell
gcloud container clusters get-credentials $(t output -raw kubernetes_cluster_name) --zone $(t output -raw zone) --project $(t output -raw project)
```

Or just use `./get-credentials.sh`

4. Destroy all resources

```shell
t destroy
```

## Additional info

Some manual tests.

### terraform
✅ create cluster<br>
✅ `./get-credentials.sh`<br>
✅ manual cred command<br>
✅ output `gcloud_gke_get_creds` command<br>
✅ create simple nginx pod `kubectl run nginx --image=nginx:latest -n default && kubectl get po -w`<br>
✅ `flux install && kubectl get po -n flux-system -w`<br>
✅ destroy cluster

### opentofu
✅ create cluster<br>
✅ `./get-credentials.sh`<br>
✅ manual cred command<br>
✅ output `gcloud_gke_get_creds` command<br>
✅ create simple nginx pod `kubectl run nginx --image=nginx:latest -n default && kubectl get po -w`<br>
✅ `flux install && kubectl get po -n flux-system -w`<br>
✅ destroy cluster

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~>5.42.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~>2.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.42.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.primary_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_project_service.service_networking](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [kubernetes_namespace.this-is-demo-cluster](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [google_client_config.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Google Project to create resources in | `string` | `"demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | `"us-central1"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The region to host the cluster in | `string` | `"us-central1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcloud_gke_get_creds"></a> [gcloud\_gke\_get\_creds](#output\_gcloud\_gke\_get\_creds) | Command to get GKE credentials |
| <a name="output_gcloud_gke_link"></a> [gcloud\_gke\_link](#output\_gcloud\_gke\_link) | GKE web ui link |
| <a name="output_gcloud_vpc_link"></a> [gcloud\_vpc\_link](#output\_gcloud\_vpc\_link) | VPC web ui link |
| <a name="output_kubernetes_cluster_host"></a> [kubernetes\_cluster\_host](#output\_kubernetes\_cluster\_host) | GKE Cluster Host |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | GKE Cluster Name |
| <a name="output_project"></a> [project](#output\_project) | GCloud Project ID |
| <a name="output_region"></a> [region](#output\_region) | GCloud Region |
| <a name="output_zone"></a> [zone](#output\_zone) | GCloud Project ID |
<!-- END_TF_DOCS -->
