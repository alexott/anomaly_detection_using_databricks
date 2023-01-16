resource "databricks_sql_endpoint" "demo_endpoint" {
  warehouse_type = "PRO"
  num_clusters   = 1
  name           = "Anomaly Demo (${data.databricks_current_user.me.alphanumeric})"
  cluster_size   = "2X-Small"
  auto_stop_mins = 10
}
