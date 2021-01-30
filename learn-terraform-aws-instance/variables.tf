variable "region" {
  default = "us-west-2"
}

# Declare implicitly by using brackets []
variable "cidrs" { default = [] }

# Declare explicitly with 'list'
variable "cidrs" { type = list }

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-fc0b939c"
  }
}
