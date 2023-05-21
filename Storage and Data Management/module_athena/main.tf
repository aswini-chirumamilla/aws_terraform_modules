# module athena
module "athena" {
  source             = "../../modules/module_athena"
  athena_database    = var.athena_database
  athena_workgroup   = var.athena_workgroup
  athena_named_query = var.athena_named_query
}