variable "location" {
  description = "regiao de criao dos recursos"
  type        = string
  default     = "westus"

}

variable "account_tier" {
  description = "tier da storage_account azure"
  type        = string
  default     = "Standard"

}

variable "account_replication_type" {
  description = "tipo de replicacao de dados storage_account azure"
  type        = string
  default     = "LRS"
  sensitive   = true

}

