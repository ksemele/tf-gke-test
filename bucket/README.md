# bucket

You should be an admin/owner of your sandbox or have enougth permissions to create a bucket.

If you use a lot of accounts and specific IAM rules, you can check the permissions of the user with the following command:

```shell
gcloud projects get-iam-policy <GCP_PROJECT> --format=json | jq '.bindings[] | select(.members[] | contains("user:<YOUR@gmail.com>"))'
```

`"role": "roles/owner"` would be great for you.

## How to use the code

1. Create `terraform.tfvars` file with a few variables

```shell
project          = "your-gcp-project"
iam_user_email   = "your@gmail.com"
```

`region` is optional.

2. Create bucket

All commands will be applied via Terraform 1.8.0 or via OpenTofu, the same version.
I use alias `t` for the commands.

```shell
t init
t apply
```

2. Destrouy bucket sfter your tests

```shell
t destroy
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~>5.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.41.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bucket"></a> [bucket](#module\_bucket) | terraform-google-modules/cloud-storage/google//modules/simple_bucket | ~> 6.0 |

## Resources

| Name | Type |
|------|------|
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_user_email"></a> [iam\_user\_email](#input\_iam\_user\_email) | Your gcloud account | `string` | `"demo@gmail.com"` | no |
| <a name="input_project"></a> [project](#input\_project) | Google Project to create resources in | `string` | `"demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | `"europe-west1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcloud_bucket_link"></a> [gcloud\_bucket\_link](#output\_gcloud\_bucket\_link) | Bucket web ui link |
| <a name="output_project"></a> [project](#output\_project) | GCloud Project ID |
| <a name="output_region"></a> [region](#output\_region) | GCloud Region |
<!-- END_TF_DOCS -->