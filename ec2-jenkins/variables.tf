##define region usada para o provider
variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}
#define tipo da instancia
variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.medium"
}
#define a subnet a ser usada (substituido pelo data no ecs.tf)
variable "instance_subnet" {
  type        = string
  description = ""
  #default     = "subnet-0d89eba24a427e534"
  default     = ""
}
#define qual OS a ami vai procurar
variable "ami_os" {
  type        = string
  description = ""
  default     = "ubuntu"
}
#define o nome da key_pair, é passado no plan do terraform pelo usuário/pipeline
variable "key_name" {}
#define o caminho do arquivo userdata que faz o setup do jenkins para a ec2
variable "user_data" {
  default = "./scripts-sh/install_jenkins_ubuntu.sh"
}
#define o id do security_group (substituido pelo data no ecs.tf)
variable "security_group_id"{
  #default = ["sg-84f010a3"]
  default = [""]
}
#define as tags para todos recursos)
variable "tags"{
  default = {
    Name         = "Jenkins"
    Managed_by   = "Terraform"
    }
}

