output "Cost_Usage_Report_ARN" {
  description = "sets the name for the cost and usage report"
  value = aws_cur_report_definition.cur_report_definition.arn
}
