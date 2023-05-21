#aws cost and usage report
output "Cost_Usage_Report_ARN" {
  value       = module.aws_cur_report_definition.Cost_Usage_Report_ARN
  description = "sets the name for the cost and usage report"
}