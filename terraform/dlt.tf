resource "databricks_pipeline" "this" {
  name       = "Anomaly Detection Demo (${data.databricks_current_user.me.alphanumeric})"
  depends_on = [databricks_dbfs_file.initial]

  configuration = {
    "anomaly_detect_model_name" : var.model_name,
    "landing_directory" : var.landing_dir
  }

  target = var.target_db_name

  library {
    notebook {
      path = "${local.base_path}/dlt_task_0_iforest_dlt_udf"
    }
  }
  library {
    notebook {
      path = "${local.base_path}/dlt_task_1_anomaly_detector"
    }
  }

  continuous  = false
  development = true
}
