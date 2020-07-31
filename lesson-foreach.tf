variable "resource_groups" {
    type = list(object({
        resource_group = string
        subnet_id = string
        vm_size = string
    }))
}

#----------------------------------------------
# for_each : 
#   - composability of modular terraform configurations
#   - Easily maintain large or complex terraform codebases
#----------------------------------------------
module "azure_vm_deploy" {
    source = "Azure/compute/azurerm"
    for_each = var.resource_groups
    
    resource_group_name = each.value.resource_group
    vnet_subnet_id = each.value.subnet_id
    vm_size = each.value.vm_size
}