# private-cluster-module

## What is created ty thah template

This example is using remote bucket state. You can modify this manually or not.

1. VPC network with one subnet
2. GKE cluster with external endpoint and only authorized networks access.
3. Workload nodepool with one node
3. Namespace `this-is-demo-cluster`

## How to use the code

### Optional bucket usage.
If you would try to use bucket state, you need to uncomment code block in [backend.tf](backend.tf).

Then go to [../bucket](../bucket/) directory and create the bucket by following the instructions at [README](../bucket/README.md).

Then return to this directory.

1. Create `terraform.tfvars` file with a few variables

```shell
project          = "your-gcp-project"
host_project     = "your-gcp-project"

master_authorized_networks = [
  { cidr_block = "0.0.0.1/32", display_name = "your current IP" }
]
```

`region`, `zone` and `environment_name` are optional

Your current IP you can get via this command for example:

```shell
curl -s ifconfig.me
```

2. Create cluster
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
gcloud container clusters get-credentials $(t output -raw kubernetes_cluster_name) --region $(t output -raw zone) --project $(t output -raw project)
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
✅ try access from different networks<br>
✅ manual cred command<br>
✅ output `gcloud_gke_get_creds` command<br>
✅ output links<br>
✅ create simple nginx pod `kubectl run nginx --image=nginx:latest -n default && kubectl get po -w`<br>
✅ `flux install && kubectl get po -n flux-system -w`<br>
✅ destroy cluster<br>
✅ test bucket backend

### opentofu
✅ create cluster<br>
✅ `./get-credentials.sh`<br>
✅ try access from different networks<br>
✅ manual cred command<br>
✅ output `gcloud_gke_get_creds` command<br>
✅ output links<br>
✅ create simple nginx pod `kubectl run nginx --image=nginx:latest -n default && kubectl get po -w`<br>
✅ `flux install && kubectl get po -n flux-system -w`<br>
✅ destroy cluster<br>
✅ test bucket backend

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~>5.41.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.41 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~>2.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.41.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_flux-cluster-variables"></a> [flux-cluster-variables](#module\_flux-cluster-variables) | git@bitbucket.org:altenar/terraform-module-k8s-flux-cluster-variables.git | 1.0.0 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant | 32.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_project_service.service_networking](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [kubernetes_namespace.this-is-demo-cluster](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_credentials_json"></a> [bucket\_credentials\_json](#input\_bucket\_credentials\_json) | Default path to your gcloud credentials json file | `string` | `"~/.config/gcloud/application_default_credentials.json"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name | `string` | `"your-project-bucket"` | no |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Path to store your state in bucket | `string` | `"terraform/state/demo"` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Environment name | `string` | `"demo"` | no |
| <a name="input_host_project"></a> [host\_project](#input\_host\_project) | The GCP project housing the VPC network to host the cluster in | `string` | `"demo"` | no |
| <a name="input_master_authorized_networks"></a> [master\_authorized\_networks](#input\_master\_authorized\_networks) | List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists). | `list(object({ cidr_block = string, display_name = string }))` | <pre>[<br>  {<br>    "cidr_block": "1.1.1.1/32",<br>    "display_name": "Use your IP/VPN IP here"<br>  }<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Google Project to create resources in | `string` | `"demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | `"europe-west1"` | no |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | The GCP network to apply firewall rules in | `string` | `"demo-vpc"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The region to host the cluster in | `string` | `"europe-west1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcloud_gke_get_creds"></a> [gcloud\_gke\_get\_creds](#output\_gcloud\_gke\_get\_creds) | Command to get GKE credentials |
| <a name="output_gcloud_gke_link"></a> [gcloud\_gke\_link](#output\_gcloud\_gke\_link) | GKE web ui link |
| <a name="output_gcloud_vpc_link"></a> [gcloud\_vpc\_link](#output\_gcloud\_vpc\_link) | VPC web ui link |
| <a name="output_kubernetes_cluster_host"></a> [kubernetes\_cluster\_host](#output\_kubernetes\_cluster\_host) | GKE Cluster Host |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | GKE Cluster Name |
| <a name="output_master_authorized_networks_config"></a> [master\_authorized\_networks\_config](#output\_master\_authorized\_networks\_config) | Here are networks that are allowed to reach your k8s API |
| <a name="output_project"></a> [project](#output\_project) | GCloud Project ID |
| <a name="output_region"></a> [region](#output\_region) | GCloud Region |
| <a name="output_zone"></a> [zone](#output\_zone) | GCloud Project ID |
<!-- END_TF_DOCS -->
