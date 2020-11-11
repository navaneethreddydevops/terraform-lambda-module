resource "aws_lambda_function" "lambda_function" {
  role             = aws_iam_role.lambda.arn
  handler          = var.handler
  runtime          = var.runtime
  filename         = "lambda.zip"
  function_name    = "var.function_name
  source_code_hash = "${base64sha256(file("lambda.zip"))}"
}

resource "aws_iam_role" "lambda" {
  name               = "lambda_execution_role"
  path               = "/"
  description        = "Allows Lambda Function to call AWS services on your behalf."
  assume_role_policy = data.aws_iam_policy_document.trustentity.json
}