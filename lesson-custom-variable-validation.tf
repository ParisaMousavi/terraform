/*
 Custom Variable Validation
    - Expand on Type Constraint validation with condition arguments and custom error message
*/
variable "ami_id" {
    type = string
    validation{
        condition = (
            length(var.ami_id) > 4 &&
            substr(var.ami_id,0,4) == "ami-"
        )
        error_message = "The ami_id value must start with \"ami-\"."
    }
}