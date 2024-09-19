variable "tenant" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "allow_assumed_role" {
  description = "Role to be added as trusted principal"
  type        = list(string)
  default     = []

}

variable "oidc_audience_arn" {
  type        = string
  description = "eks oidc provider role arn"
}

variable "federated_service_account" {
  description = "Service Account principle to be added to assume role"
  type        = list(string)
  default     = []
}

variable "oidc_subject" {
  type        = string
  description = "eks oidc subject arn"
}