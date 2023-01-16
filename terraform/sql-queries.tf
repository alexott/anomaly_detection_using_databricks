resource "databricks_sql_query" "anomaly_detection_results_33ed24a9_798b_494e_951f_41432d7968e2" {
  query          = "select is_anomaly, count(1) as count from ${var.target_db_name}.predictions group by is_anomaly"
  name           = "Anomaly Detection: Results (${data.databricks_current_user.me.alphanumeric})"
  data_source_id = databricks_sql_endpoint.demo_endpoint.data_source_id
}
resource "databricks_sql_query" "anomaly_detection_results_per_minute_4019117c_605d_42e5_bed8_a3281c960a84" {
  query          = "select date_trunc('minute', timestamp), count(1) as count \nfrom ${var.target_db_name}.predictions \nwhere is_anomaly and timestamp >= dateadd(HOUR, -24, current_timestamp)\ngroup by 1"
  name           = "Anomaly Detection: Results per Minute (${data.databricks_current_user.me.alphanumeric})"
  data_source_id = databricks_sql_endpoint.demo_endpoint.data_source_id
}
resource "databricks_sql_query" "anomaly_detection_transactions_per_minute_7f825327_96e7_4400_b012_8c34758d8d0e" {
  query          = "select date_trunc('minute', timestamp), count(1) as count \nfrom ${var.target_db_name}.predictions \nwhere timestamp >= dateadd(HOUR, -24, current_timestamp)\ngroup by 1"
  name           = "Anomaly Detection: Transactions per Minute (${data.databricks_current_user.me.alphanumeric})"
  data_source_id = databricks_sql_endpoint.demo_endpoint.data_source_id
}

resource "databricks_sql_query" "anomaly_detection_latest_anomalies_59dc477b_681c_4885_9301_309ffdc470cb" {
  query          = "select cust_id, amount, timestamp \nfrom ${var.target_db_name}.predictions\nwhere is_anomaly and timestamp >= dateadd(MINUTE, -10, current_timestamp)\norder by timestamp desc, amount desc\nlimit 10\n"
  name           = "Anomaly Detection: Latest anomalies (${data.databricks_current_user.me.alphanumeric})"
  data_source_id = databricks_sql_endpoint.demo_endpoint.data_source_id
}
