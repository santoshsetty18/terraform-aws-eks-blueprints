module "helm_addon" {
  source = "../helm-addon"
  # count  = var.enable_self_managed_aws_ebs_csi_driver 

  # https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/charts/aws-ebs-csi-driver/Chart.yaml
  helm_config = merge({
    name             = "opensearch"
    chart            = "opensearch"
    repository       = "https://opensearch-project.github.io/helm-charts/"
    version          = "2.9.1"
    namespace        = "opnesearch"
    create_namespace = true
    #values           = [templatefile("${path.module}/values.yaml", {})]
    description      = "Opensearch Helm chart deployment configuration"
    },
    var.helm_config
  )

  /* module "helm_addon" {
  source = "../helm-addon"
  # count  = var.enable_self_managed_aws_ebs_csi_driver 

  # https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/charts/aws-ebs-csi-driver/Chart.yaml
  helm_config = merge({
    name             = "opensearch_dashboard"
    chart            = "opensearch_dashboard"
    repository       = "https://opensearch-project.github.io/helm-charts/"
    version          = "2.9.1"
    namespace        = "opensearch"
    create_namespace = true
    #values           = [templatefile("${path.module}/values.yaml", {})]
    description      = "Opensearch Helm chart deployment configuration"
    },
    var.helm_config
  ) */