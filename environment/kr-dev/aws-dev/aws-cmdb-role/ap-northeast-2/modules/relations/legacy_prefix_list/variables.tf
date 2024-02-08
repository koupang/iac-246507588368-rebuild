variable "prefix_list_ids_with_legacy_relations" {
  description = "A list of managed prefix list ID for value of the previous security group rules"
  type        = map(list(string))
}
