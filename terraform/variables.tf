variable "cc_data_path" {
  type = string
  description = "File path to the creditcard.csv file from Kaggle dataset"
  default = "/tmp/dlt-anomaly-demo/original-data/creditcard.csv"
}

variable "model_name" {
  type = string
  description = "Name of the anomaly detection model"
  default = "aott_iforest"
}

variable "target_db_name" {
  type = string
  description = "Name of the database to which data will be written"
  default = "dlt_anomaly_demo"
}

variable "landing_dir" {
  type = string
  description = "Path to directory where generated data will be stored"
  default = "/tmp/dlt-anomaly-demo/transaction_landing_dir"
}
