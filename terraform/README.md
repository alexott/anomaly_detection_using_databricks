This folder contains Terraform code to setup full anomaly detection with DLT demo. 

To setup everything you need following:

* Download [demo data from kaggle](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud) and unpack into the current folder, make sure that file `creditcard.csv` is present in it
* Put into `terraform.tfvars` values for variables defined in the `variables.tf` that you want to override from the default values.
* Perform `terraform init`
* Check that everything is in place by running `terraform plan`
* Apply changes with `terraform apply` - it will:
  * Clone a repository from GitHub into your personal Databricks Repo
  * Upload demo data to DBFS
  * Create DLT pipeline
  * Create Databricks Job
  * Create Databricks SQL Warehouse & SQL queries/dashboards

After deployment is done, execute code in `iforest_train_register` notebook to generate a model (adjust parameters, such as, model name and input data path if necessary). And after that you can run created job.

