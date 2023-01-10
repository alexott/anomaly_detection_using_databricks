resource "databricks_job" "this" {
  name       = "Anomaly Detection Demo (${data.databricks_current_user.me.alphanumeric})"
  depends_on = [databricks_dbfs_file.creditcard, databricks_dbfs_file.initial]

  task {
    task_key = "generate_data"

    new_cluster {
      num_workers   = 0
      spark_version = data.databricks_spark_version.latest_lts.id
      node_type_id  = data.databricks_node_type.smallest.id

      spark_conf = {
        # Single-node
        "spark.databricks.cluster.profile" : "singleNode"
        "spark.master" : "local[*]"
      }

      custom_tags = {
        "ResourceClass" = "SingleNode"
      }
    }

    notebook_task {
      notebook_path = "${local.base_path}/json_record_generator"
      base_parameters = {
        "minutes_run" : "40",
        "dest_dir" : var.landing_dir,
        "input_data" : var.cc_data_path
      }
    }
  }

  task {
    task_key = "dlt"
    pipeline_task {
      pipeline_id = databricks_pipeline.this.id
    }
  }
}
