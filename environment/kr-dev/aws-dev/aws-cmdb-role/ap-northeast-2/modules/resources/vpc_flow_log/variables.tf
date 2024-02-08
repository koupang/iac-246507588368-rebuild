variable "vpc_id" {
  description = "The ID of the VPC to associate with the flow log"
  type        = string
}

variable "deliver_cross_account_role" {
  description = "The role ARN to deliver logs to a different AWS account"
  type        = string
  default     = null
}

variable "eni_id" {
  description = "The ID of the Elastic Network Interface (ENI) to associate with the flow log"
  type        = string
  default     = null
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role that grants permission to publish flow logs to CloudWatch Logs"
  type        = string
  default     = null
}

variable "log_destination" {
  description = "The ARN of the S3 bucket or S3 bucket prefix to deliver flow logs to"
  type        = string
  default     = "" // "arn:aws:s3:::s3-simple-vpc-flow-logs"
}

variable "log_destination_type" {
  description = "The type of destination to deliver flow logs to"
  type        = string
  default     = "cloud-watch-logs"
}

variable "log_format" {
  description = "The format of the flow log record"
  type        = string
  default     = "$${version} $${account-id} $${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${start} $${end} $${action} $${log-status}"
}

variable "max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record"
  type        = number
  default     = 600
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the flow log"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the flow log"
  type        = map(string)
}

variable "traffic_type" {
  description = "traffic_type - (Required) The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL"
  type        = string
  validation {
    condition     = can(regex("^(ACCEPT|REJECT|ALL)$", var.traffic_type))
    error_message = "Invalid traffic_type. Valid values are ACCEPT, REJECT, ALL."
  }
}

variable "transit_gateway_attachment_id" {
  description = "The ID of the transit gateway attachment to associate with the flow log"
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "The ID of the transit gateway to associate with the flow log"
  type        = string
  default     = null
}

variable "destination_options" {
  description = "Destination options for the flow log"
  type = list(object({
    file_format                = string
    hive_compatible_partitions = bool
    per_hour_partition         = bool
  }))
  default = [{
    file_format                = "plain-text"
    hive_compatible_partitions = false
    per_hour_partition         = false
  }]
}