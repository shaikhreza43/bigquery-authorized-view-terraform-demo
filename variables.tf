variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

#BQ parameters
variable "delete_contents_on_destroy" {
  description = "(Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = bool
  default     = null
}

variable "access_bq" {
  description = "An array of objects that define dataset access for one or more entities."
  type        = any
}

variable "datasets_bq" {
  description = "this is a test DS"
  default = []
  type = list(object({
        dataset_id = string
        friendly_name = string
        location = string
   }
  ))
}

variable "tables_bq" {
  description = "A list of objects which include table_id, schema, clustering, time_partitioning, expiration_time and labels."
  default     = []
  type = list(object({
    table_id   = string,
    dataset_id = string, #added to test creating multi dataset
    schema     = string,
    clustering = list(string),
    deletion_protection=bool,
    time_partitioning = object({
      expiration_ms            = string,
      field                    = string,
      type                     = string,
      require_partition_filter = bool,
    }),
    expiration_time = string,
    labels          = map(string),
  }
  ))
}

variable "views_bq" {
  description = "A list of objects which include table_id, which is view id, and view query"
  default     = []
  type = list(object({
    view_id        = string,
    dataset_id     = string,
    query          = string,
    deletion_protection=bool,
    use_legacy_sql = bool,
    labels         = map(string),
  }))
}