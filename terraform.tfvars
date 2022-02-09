project_id="prj-dfaccessprovision-d-64a9"
delete_contents_on_destroy=false
datasets_bq=[
   {
      dataset_id = "bq_access_provisioning_ds_ahmedtesting"
      friendly_name = "dataset for AMP access provision"
      location = "US"
   },
   {
      dataset_id = "audit_shared_dataset"
      friendly_name = "dataset for uam team"
      location = "US"
   }
]
access_bq = [
    {
      role        = "roles/bigquery.dataOwner"
      user_by_email = "sreza4@ford.com"
    }
  ]

  tables_bq=[
     {
      table_id = "enduser_request_tb"  
      dataset_id="bq_access_provisioning_ds_ahmedtesting"  
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
      dataset_id="bq_access_provisioning_ds_ahmedtesting"  
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

   views_bq =[
     {
    view_id = "test_view_1"
    dataset_id="audit_shared_dataset"
    use_legacy_sql = false
    deletion_protection =false
    query = "SELECT * FROM `prj-dfaccessprovision-d-64a9.bq_access_provisioning_ds_ahmedtesting.enduser_request_details_tb`"
    labels = {
      env      = "sandbox"
      billable = "false"
      owner    = "ahmed"
    }
  }
   ]
