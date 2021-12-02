variable "sub-id" {
  type = string
  default = "53d60844-4bdb-410f-a330-2fa78aa5ca81"
}

variable "rg-name" {
  type = string
  default = "LabRG_RKMRG"
}

variable "app-serv-name" {
    type = string
    default = "aps-mf-dev-01"
}

variable "key-vault-name" {
    type = string
    default = "kv-mf-dev-01-raf"
}

variable "function-storage-name" {
    type = string
    default = "samffundev01"
}

variable "aks-cluster-name" {
  type = string
  default = "aks-mf-dev-01"
}