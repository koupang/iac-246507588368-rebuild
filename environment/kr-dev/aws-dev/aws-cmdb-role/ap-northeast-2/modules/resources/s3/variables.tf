
variable "bucket_name" {
  type        = string
  description = "(optional) describe your variable"
}
# variable "bucket_policy" {
#   type        = string
#   description = "(optional) describe your variable"
# }

# variable "bucket_prefix" {
#   type        = string
#   description = "(optional) describe your variable"
# }

variable "force_destroy" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "object_lock_enabled" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
  default     = {}
}