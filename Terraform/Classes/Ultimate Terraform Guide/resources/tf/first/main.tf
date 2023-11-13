provider "aws" {
  region = "us-east-1"
  access_key = "AKARAASIDFADFAGASDFADS"
  secret_key = "1wspsfadfqwerfasdfdassd/JVsdfasqewwrew"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}
