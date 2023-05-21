#-----------------------------Security Group Resource-------------------------#
resource "aws_security_group" "tfsg" {
  name                   = var.security_group_name
  description            = var.sg_description
  vpc_id                 = var.sg_vpcid
  revoke_rules_on_delete = var.revoke_rules_on_delete
  tags                   = var.sg_tags
  #name_prefix           = var.name_prefix #Note:Conflicts with name argument

  dynamic "ingress" {
    for_each = var.sg_ingress
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      description      = lookup(ingress.value, "description", null)
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(ingress.value, "prefix_list_ids", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
      self             = lookup(ingress.value, "self", null)
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      description      = lookup(egress.value, "description", null)
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(egress.value, "prefix_list_ids", null)
      security_groups  = lookup(egress.value, "security_groups", null)
      self             = lookup(egress.value, "self", null)
    }
  }
}
#-------------------------end-Security Group Resource-------------------------#