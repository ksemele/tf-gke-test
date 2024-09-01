# Terraform GKE clusters templates

Hello everyone! I'm glad to see you here.
This is a repository with a few examples of GKE clusters that you can create in your own GCP project.
Feel free to use this code in sandboxes for testing purposes.

Also, I'm adding links to this repository in my articles on [my Medium](https://medium.com/@ksemele) and other places.

## How to use this repo

You can see a few directories in this repo:
* [bucket](https://github.com/ksemele/tf-gke-test/tree/main/bucket) - terraform code for creating google bucket for storing remote state
* [simple-template](https://github.com/ksemele/tf-gke-test/tree/main/simple-template) - Simple GKE example. Usually it's enough for any of my tests.
* [private-cluster-module](https://github.com/ksemele/tf-gke-test/tree/main/private-cluster-module) - GKE created by `beta-private-cluster-update-variant` module. Creates GKE cluster with a private network.

Each directory contains its own readme with all needed commands to reproduce the example.
---

❤️ I'm very thankful to [Altenar](https://altenar.com) who sponsored me in this project.
