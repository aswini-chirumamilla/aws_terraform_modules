# module athena database

output "athena_database_id" {
  description = "The name of the database"
  value       = [for athena_database in aws_athena_database.database : athena_database.id]
}

# module athena workgroup

output "athena_workgroup_id" {
  description = "The name of the workgroup"
  value       = [for workgroup in aws_athena_workgroup.workgroup : workgroup.id]
}

# module athena namedquery

output "athena_named_query" {
  description = "Unique id of the queries"
  value       = [for named_query in aws_athena_named_query.named_query : named_query.id]
}