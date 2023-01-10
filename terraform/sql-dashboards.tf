resource "databricks_sql_dashboard" "anomaly_detection_demo" {
  name = "Anomaly Detection Demo (${data.databricks_current_user.me.alphanumeric})"
}
resource "databricks_sql_visualization" "bar_1_4019117c_605d_42e5_bed8_a3281c960a84e6b89111_5d47_4a75_bca4_cf6607018a9c" {
  type       = "chart"
  query_plan = "{\"selects\": [{\"column\": \"date_trunc(minute, timestamp)\"}, {\"function\": \"SUM\", \"args\": [{\"column\": \"count\"}], \"alias\": \"column_b0eb2e0219381\"}], \"groups\": [{\"column\": \"date_trunc(minute, timestamp)\"}]}"
  query_id   = databricks_sql_query.anomaly_detection_results_per_minute_4019117c_605d_42e5_bed8_a3281c960a84.id
  options    = "{\"version\": 2, \"globalSeriesType\": \"column\", \"sortX\": true, \"sortY\": true, \"legend\": {\"traceorder\": \"normal\"}, \"xAxis\": {\"type\": \"-\", \"labels\": {\"enabled\": true}, \"title\": {\"text\": \"Time\"}}, \"yAxis\": [{\"type\": \"-\", \"title\": {\"text\": \"Anomalies detected\"}}, {\"type\": \"-\", \"opposite\": true}], \"alignYAxesAtZero\": true, \"error_y\": {\"type\": \"data\", \"visible\": true}, \"series\": {\"stacking\": null, \"error_y\": {\"type\": \"data\", \"visible\": true}}, \"seriesOptions\": {\"column_b0eb2e0219381\": {\"name\": \"count\", \"yAxis\": 0, \"type\": \"column\", \"color\": \"#FF0000\"}}, \"valuesOptions\": {}, \"direction\": {\"type\": \"counterclockwise\"}, \"sizemode\": \"diameter\", \"coefficient\": 1, \"numberFormat\": \"0,0[.]00000\", \"percentFormat\": \"0[.]00%\", \"textFormat\": \"\", \"missingValuesAsZero\": true, \"useAggregationsUi\": true, \"swappedAxes\": false, \"dateTimeFormat\": \"YYYY-MM-DD HH:mm\", \"showDataLabels\": false, \"columnConfigurationMap\": {\"x\": {\"column\": \"date_trunc(minute, timestamp)\", \"id\": \"column_b0eb2e0219380\"}, \"y\": [{\"column\": \"count\", \"transform\": \"SUM\", \"id\": \"column_b0eb2e0219381\"}]}, \"isAggregationOn\": true}"
  name       = "Bar 1"
}
resource "databricks_sql_visualization" "bar_1_7f825327_96e7_4400_b012_8c34758d8d0e2e9b6cd7_7fb9_4886_8e45_4bb37ac139d8" {
  type       = "chart"
  query_plan = "{\"selects\": [{\"column\": \"date_trunc(minute, timestamp)\"}, {\"function\": \"SUM\", \"args\": [{\"column\": \"count\"}], \"alias\": \"column_b0eb2e0219381\"}], \"groups\": [{\"column\": \"date_trunc(minute, timestamp)\"}]}"
  query_id   = databricks_sql_query.anomaly_detection_transactions_per_minute_7f825327_96e7_4400_b012_8c34758d8d0e.id
  options    = "{\"version\": 2, \"globalSeriesType\": \"column\", \"sortX\": true, \"sortY\": true, \"legend\": {\"traceorder\": \"normal\"}, \"xAxis\": {\"type\": \"-\", \"labels\": {\"enabled\": true}, \"title\": {\"text\": \"Time\"}}, \"yAxis\": [{\"type\": \"-\", \"title\": {\"text\": \"Anomalies detected\"}}, {\"type\": \"-\", \"opposite\": true}], \"alignYAxesAtZero\": true, \"error_y\": {\"type\": \"data\", \"visible\": true}, \"series\": {\"stacking\": null, \"error_y\": {\"type\": \"data\", \"visible\": true}}, \"seriesOptions\": {\"column_b0eb2e0219381\": {\"name\": \"count\", \"yAxis\": 0, \"type\": \"column\"}}, \"valuesOptions\": {}, \"direction\": {\"type\": \"counterclockwise\"}, \"sizemode\": \"diameter\", \"coefficient\": 1, \"numberFormat\": \"0,0[.]00000\", \"percentFormat\": \"0[.]00%\", \"textFormat\": \"\", \"missingValuesAsZero\": true, \"useAggregationsUi\": true, \"swappedAxes\": false, \"dateTimeFormat\": \"YYYY-MM-DD HH:mm\", \"showDataLabels\": false, \"columnConfigurationMap\": {\"x\": {\"column\": \"date_trunc(minute, timestamp)\", \"id\": \"column_b0eb2e0219380\"}, \"y\": [{\"column\": \"count\", \"transform\": \"SUM\", \"id\": \"column_b0eb2e0219381\"}]}, \"isAggregationOn\": true}"
  name       = "Bar 1"
}
resource "databricks_sql_widget" "f498dd57_32e5_46ce_b711_93a9798e2db707ff4b1b_f293_41d2_9779_d6ecea743885" {
  visualization_id = databricks_sql_visualization.bar_1_7f825327_96e7_4400_b012_8c34758d8d0e2e9b6cd7_7fb9_4886_8e45_4bb37ac139d8.visualization_id
  title            = "Transactions count (last 24 hours)"
  position {
    size_y = 8
    size_x = 3
    pos_y  = 8
    pos_x  = 3
  }
  dashboard_id = databricks_sql_dashboard.anomaly_detection_demo.id
}
resource "databricks_sql_widget" "f498dd57_32e5_46ce_b711_93a9798e2db738a3a1f5_46a0_4aea_ac14_ed2f8c58963a" {
  visualization_id = databricks_sql_visualization.pie_1_33ed24a9_798b_494e_951f_41432d7968e23e555494_49d2_4140_9f3a_8f27b07f0dc1.visualization_id
  title            = "Anomaly Detection: Total"
  position {
    size_y = 8
    size_x = 3
  }
  dashboard_id = databricks_sql_dashboard.anomaly_detection_demo.id
}
resource "databricks_sql_widget" "f498dd57_32e5_46ce_b711_93a9798e2db766a9f48b_332f_428d_9646_9f34d8e85fbc" {
  visualization_id = databricks_sql_visualization.bar_1_4019117c_605d_42e5_bed8_a3281c960a84e6b89111_5d47_4a75_bca4_cf6607018a9c.visualization_id
  title            = "Anomaly Detections (last 24 hours)"
  position {
    size_y = 8
    size_x = 3
    pos_x  = 3
  }
  dashboard_id = databricks_sql_dashboard.anomaly_detection_demo.id
}
resource "databricks_sql_visualization" "pie_1_33ed24a9_798b_494e_951f_41432d7968e23e555494_49d2_4140_9f3a_8f27b07f0dc1" {
  type       = "chart"
  query_plan = "{\"selects\": [{\"column\": \"is_anomaly\"}, {\"function\": \"SUM\", \"args\": [{\"column\": \"count\"}], \"alias\": \"column_b0eb2e0210089\"}], \"groups\": [{\"column\": \"is_anomaly\"}]}"
  query_id   = databricks_sql_query.anomaly_detection_results_33ed24a9_798b_494e_951f_41432d7968e2.id
  options    = "{\"version\": 2, \"globalSeriesType\": \"pie\", \"sortX\": true, \"sortY\": true, \"legend\": {\"traceorder\": \"normal\"}, \"xAxis\": {\"type\": \"-\", \"labels\": {\"enabled\": true}}, \"yAxis\": [{\"type\": \"-\"}, {\"type\": \"-\", \"opposite\": true}], \"alignYAxesAtZero\": true, \"error_y\": {\"type\": \"data\", \"visible\": true}, \"series\": {\"stacking\": null, \"error_y\": {\"type\": \"data\", \"visible\": true}}, \"seriesOptions\": {\"column_b0eb2e0210089\": {\"name\": \"Anomalies detected\", \"yAxis\": 0, \"type\": \"pie\"}}, \"valuesOptions\": {}, \"direction\": {\"type\": \"counterclockwise\"}, \"sizemode\": \"diameter\", \"coefficient\": 1, \"numberFormat\": \"0,0[.]00000\", \"percentFormat\": \"0[.]00%\", \"textFormat\": \"\", \"missingValuesAsZero\": true, \"useAggregationsUi\": true, \"swappedAxes\": false, \"dateTimeFormat\": \"YYYY-MM-DD HH:mm\", \"showDataLabels\": true, \"columnConfigurationMap\": {\"x\": {\"column\": \"is_anomaly\", \"id\": \"column_b0eb2e0210088\"}, \"y\": [{\"column\": \"count\", \"transform\": \"SUM\", \"id\": \"column_b0eb2e0210089\"}]}, \"isAggregationOn\": true}"
  name       = "Pie 1"
}
