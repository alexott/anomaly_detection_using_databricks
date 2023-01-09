resource "databricks_dbfs_file" "creditcard" {
  source = "${path.module}/creditcard.csv"
  path   = var.cc_data_path
}

resource "databricks_dbfs_file" "initial" {
  source = "${path.module}/initial"
  path   = "${var.landing_dir}/initial"
}
