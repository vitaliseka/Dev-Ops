variable "rg" {
  description = "resourcegroup name"
  type = string
  default = "this_onas_rg"

}
variable "location" {
    description = "resourcegroup location"
    type = string
    default = "uksouth"
  
}
variable "win_user_name" {
    description = "window vm username"
    type = string
    default = "adminuser"
  
}
variable "win_password" {
    description = "window vm password"
    type = string
    default = "P@$$w0rd1234!"
  
}
variable "win_vm_name" {
    description = "window vm name"
    type = string
    default = "thisonas-winvm"
}
variable "owner"{
    description = "resource owner"
    type = string
    default = "rasheed"
}
variable "environment"{
    description = "resource environment"
    type = string
    default = "dev"
}