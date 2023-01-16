terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.8.0"
    }
  }
}

provider "databricks" {
  # Configuration options
}

data "databricks_current_user" "me" {}
data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  ml                = true
}
data "databricks_node_type" "smallest" {
  local_disk = true
}

resource "databricks_repo" "anomaly_demo" {
  url = "https://github.com/alexott/anomaly_detection_using_databricks.git"
}

locals {
  base_path = databricks_repo.anomaly_demo.path
}

