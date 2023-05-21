#----------availability zones -------#
data "aws_availability_zones" "az" {
  state = "available"
}
#--------end-availability zones -----#

#----------owner ID -------#
data "aws_caller_identity" "current" {}
#----------owner ID --------#