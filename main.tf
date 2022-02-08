module "bq_module" {
  source = "git@github.com:shaikhreza43/gcp-bq-authorized-view-terraform.git"
  project_id  = var.project_id
  delete_contents_on_destroy  = var.delete_contents_on_destroy
  datasets      =var.datasets_bq
  access = var.access_bq
  tables= var.tables_bq
  views = var.views_bq
}
