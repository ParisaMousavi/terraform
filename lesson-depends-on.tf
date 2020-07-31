resource "aws_iam_policy_attachment" "example" {
    name = string
    roles = [aws_iam_role.example.name]
    policy_arn = aws_iam_policy.example.arm
}



/*
 deoends-on
    - composability of modular terraform configurations 
    - Easily maintain large or complex terraform codebases
    - But it doesn't cover every thing
*/
module "iam_user_config" {
    #source = ""
    depends-on = [aws_iam_policy_attachment.example]
}