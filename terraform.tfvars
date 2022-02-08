project_id="prj-ford-amp"
delete_contents_on_destroy=false
datasets_bq=[
   {
      dataset_id = "bq_access_provisioning_ds"
      friendly_name = "dataset for AMP access provision"
      location = "US"
   }
]
access_bq = [
    {
      role          = "roles/bigquery.dataOwner"
    user_by_email = "shaikh.reza@quantiphi.com"
    }
  ]

  tables_bq=[
     {
      table_id = "enduser_request_tb"  
      dataset_id="bq_access_provisioning_ds"  
      schema = "enduser_request_schema.json"
      clustering = ["request_id"]   
      expiration_time = null
      deletion_protection = false
      time_partitioning = {                       
            type                     = "DAY",     
            field                    = null,      
            require_partition_filter = false,     
            expiration_ms            = null,      
          },    
      labels = {                                  
          env      = "development"
          billable = "false"
        }
    }, {
      table_id = "enduser_request_details_tb"  
      dataset_id="bq_access_provisioning_ds"  
      schema = "enduser_request_details_schema.json"
      clustering = ["request_id"]   
      expiration_time = null
      deletion_protection = false
      time_partitioning = {                       
            type                     = "DAY",     
            field                    = null,      
            require_partition_filter = false,     
            expiration_ms            = null,      
          },    
      labels = {                                  
          env      = "development"
          billable = "false"
        }
    }
  ]

   views_bq =[]
