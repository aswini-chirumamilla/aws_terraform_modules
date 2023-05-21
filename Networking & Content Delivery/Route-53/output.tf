output "zone_id" {
    value = aws_route53_zone.hosted_zone.id
    description = "ID of hosted zone in route 53"
}

