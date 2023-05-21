aws_region = "ap-south-1"

aws_profile = "terraform"

athena_database = {
  "athenadatabase001" = {
    acl_configuration = [{
      s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
    }]
    bucket  = "awscil-avi-athena-database-output"
    comment = "Sample database for azure cil"
    encryption_configuration = [{
      encryption_option = "SSE_S3"
      kms_key           = null
    }]
    expected_bucket_owner = "239312700453"
    force_destroy         = true
    properties = {
      "developer" = "avirupchattaraj"
    }
  }
}

athena_workgroup = {
  "athenatestworkgroup001" = {
    configuration = [{
      bytes_scanned_cutoff_per_query  = 10485760
      enforce_workgroup_configuration = true
      engine_version = [{
        selected_engine_version = "AUTO"
      }]
      execution_role                     = null
      publish_cloudwatch_metrics_enabled = true
      requester_pays_enabled             = false
      result_configuration = [{
        acl_configuration = [{
          s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
        }]
        encryption_configuration = [{
          encryption_option = "SSE_KMS"
          kms_key_arn       = "arn:aws:kms:ap-south-1:239312700453:key/409a7bf0-93aa-45af-b80b-a65073d30a00"
        }]
        expected_bucket_owner = "239312700453"
        output_location       = "s3://awscil-avi-athena-database-output/"
      }]
    }]
    name = "testworkgroup001"
  }
}


athena_named_query = {
  "namedquery001" = {
    database    = "athenadatabase001"
    description = "the sample test query for aws cil"
    name        = "testquery001"
    query       = "SELECT * FROM athenadatabase001  limit 10;"
    workgroup   = "testworkgroup001"
  }
}