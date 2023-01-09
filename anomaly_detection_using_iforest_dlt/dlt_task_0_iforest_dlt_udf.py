# Databricks notebook source
# MAGIC %pip install mlflow==1.29.0

# COMMAND ----------

import mlflow
model_name = spark.conf.get("anomaly_detect_model_name", 'aott_iforest')
client = mlflow.tracking.MlflowClient()
logged_model = client.get_latest_versions(model_name, stages=["Production"])[0].source
# Load model as a Spark UDF. Override result_type if the model does not return double values.
predict_anomaly = mlflow.pyfunc.spark_udf(spark, model_uri=logged_model, result_type='double')

# COMMAND ----------

spark.udf.register("detect_anomaly", predict_anomaly)

# COMMAND ----------

#df = spark.read.json("/tmp/dlt-anomaly-demo/transaction_landing_dir")

# COMMAND ----------

#df.cache()
#df.createOrReplaceTempView("test_data")

# COMMAND ----------

#%sql
#SELECT cust_id, detect_anomaly(named_struct("Time", Time,  "V1", V1,  "V2", V2,  "V3", V3,  "V4", V4,  "V5", V5,  "V6", V6,  "V7", V7,  "V8", V8,  "V9", V9,  "V10", V10,  "V11", V11,  "V12", V12,  "V13", V13,  "V14", V14,  "V15", V15,  "V16", V16,  "V17", V17,  "V18", V18,  "V19", V19,  "V20", V20,  "V21", V21,  "V22", V22,  "V23", V23,  "V24", V24,  "V25", V25,  "V26", V26,  "V27", V27,  "V28", V28, "Amount", Amount )) as is_anomaly from test_data

# COMMAND ----------


