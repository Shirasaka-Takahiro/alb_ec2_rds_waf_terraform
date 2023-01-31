##Web ACL
resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.general_config["project"]}-${var.general_config["env"]}-webacl"
  description = "A managed rule by terraform"
  scope       = "${var.webacl_scope}"
 
  default_action {
    allow {}
  }
 
  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 10
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSetMetric"
      sampled_requests_enabled   = false
    }
  }
 
 
  rule {
    name     = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 20
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSetMetric"
      sampled_requests_enabled   = false
    }
  }
 
  rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 30
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesAmazonIpReputationListMetric"
      sampled_requests_enabled   = false
    }
  }
 
  rule {
    name     = "AWSManagedRulesAnonymousIpList"
    priority = 40
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesAnonymousIpListMetric"
      sampled_requests_enabled   = false
    }
  }
 
  rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 50
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesSQLiRuleSetMetric"
      sampled_requests_enabled   = false
    }
  }
 
  rule {
    name     = "AWSManagedRulesLinuxRuleSet"
    priority = 60
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesLinuxRuleSet"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesLinuxRuleSetMetric"
      sampled_requests_enabled   = false
    }
  }
 
  rule {
    name     = "AWSManagedRulesUnixRuleSet"
    priority = 70
 
    override_action {
      count {}
    }
 
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesUnixRuleSet"
        vendor_name = "AWS"
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesUnixRuleSetMetric"
      sampled_requests_enabled   = false
    }
  }
 
  rule {
    name     = "AWSRateBasedRule"
    priority = 1
 
    action {
      count {}
    }
 
    statement {
      rate_based_statement {
        limit              = 500
        aggregate_key_type = "IP"
 
        scope_down_statement {
          geo_match_statement {
            country_codes = ["US", "NL"]
          }
        }
      }
    }
 
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSRateBasedRuleMetric"
      sampled_requests_enabled   = false
    }
  }
 
  tags = {
    Tag1 = "Value1"
    Tag2 = "Value2"
  }
 
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "TerraformWebACLMetric"
    sampled_requests_enabled   = false
  }
}

##Attach WAF to ALB
resource "aws_wafv2_web_acl_association" "web_acl_association" {
  resource_arn = aws_lb.alb.arn
  web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
}

##Logging Configuration
resource "aws_wafv2_web_acl_logging_configuration" "logging_config" {
  log_destination_configs = [aws_s3_bucket.bucket_waf_access_log.arn]
  resource_arn            = aws_wafv2_web_acl.web_acl.arn
}