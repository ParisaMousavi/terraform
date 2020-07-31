variable "resource_groups" {
    type = list(object({
        resource_group = string
        subnet_id = string
        vm_size = string
    }))
}

#----------------------------------------------
# Count : 
#   - composability of modular terraform configurations
#   - Easily maintain large or complex terraform codebases
#----------------------------------------------
module "azure_vm_deploy" {
    source = "Azure/compute/azurerm"
    count = length(var.resource_groups)
    
    resource_group_name = var.resource_groups[count.index].resource_group
    vnet_subnet_id = var.resource_groups[count.index].subnet_id
    vm_size = var.resource_groups[count.index].vm_size
}