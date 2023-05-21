#----------Route Table-------#
data "aws_route_table" "rt" {
  count          = var.private_route_table_id == "" ? 0 : 1
  route_table_id = var.private_route_table_id
}
#------end-Route Table-------#

#----------availability zones -------#
data "aws_availability_zones" "az" {
  state = "available"
}
#--------end-availability zones -----#

#----------owner ID -------#
data "aws_caller_identity" "current" {}
#----------owner ID --------#