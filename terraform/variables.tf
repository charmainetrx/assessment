# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "access_key" {
  type        = string
  default     = {ACCESS_KEY}
}

variable "secret_key" {
  type        = string
  default     = {SECRET_KEY}
}