provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWSOCHYIZ5HOXLZNB"
  secret_key = "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"
} //its like importing a library

variable "subnet_cidr_block" {
    description = "subnet cidr block"  //this defines our varibale
    default = "10.0.10.0/24"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16" //all ip address under this range only
  tags =  {
    //key value pairs
    Name: "development"
    vpc_env: "dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id //aws_vpc.name.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "ap-south-1a"
  tags =  {
    //key value pairs
    Name: "subnet-1-dev"
  }
  
}

#jhj

