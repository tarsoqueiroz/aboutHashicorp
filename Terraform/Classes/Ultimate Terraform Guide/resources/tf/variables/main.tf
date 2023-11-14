variable "mystringvar" {
  type = string
  default = "my-first-vpc"
}

variable "mynumvar" {
  type = number
  default = 100
}

variable "isenabled" {
  default = false
}

variable "mylistvarnumber" {
  type = list(number)
  default = [ 10, 20 ]
}

variable "mylistvarstring" {
  type = list(string)
  default = [ "10.15.61.62", "apple", "character" ]
}

variable "mymapvar" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

resource "aws_vpc" "myVPC" {
  cidr_block = "10.10.10.0/24"
  
  tags = {
    Name = var.mystringvar
  }
}
