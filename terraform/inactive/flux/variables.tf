variable "github_token" {
  type        = string
  description = "github token"
}

variable "repository_name" {
  type        = string
  default     = "infrastructure"
  description = "github repository name"
}

variable "target_path" {
  type        = string
  default     = "staging-cluster"
  description = "flux sync target path"
}
