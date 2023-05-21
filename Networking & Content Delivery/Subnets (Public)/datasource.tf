#----------Route Table-------#
data "aws_route_table" "rt" {
  route_table_id = var.public_route_table_id
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