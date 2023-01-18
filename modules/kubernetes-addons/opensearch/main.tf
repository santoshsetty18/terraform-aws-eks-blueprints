locals {
  name = "opensearch"

  # https://github.com/apache/airflow/blob/main/chart/Chart.yaml
  default_helm_config = {
    name             = local.name
    chart            = local.name
    repository       = "https://opensearch-project.github.io/helm-charts/"
    version          = "2.9.1"
    namespace        = local.name
    create_namespace = true
    #values           = [templatefile("${path.module}/values.yaml", {})]
    description      = "Opensearch Helm chart deployment configuration"
  }

  helm_config = merge(local.default_helm_config, var.helm_config)
}

#-------------------------------------------------
#Opensearch Addon
#-------------------------------------------------
module "helm_addon" {
  source = "../helm-addon"

  helm_config   = local.helm_config
  addon_context = var.addon_context
}
