resource "databricks_dbfs_file" "creditcard" {
  source = "${path.module}/creditcard.csv"
  path   = var.cc_data_path
}

resource "databricks_dbfs_file" "empty" {
  source = "${path.module}/empty"
  path   = "${var.landing_dir}/empty"
}
