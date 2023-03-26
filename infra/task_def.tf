resource "aws_ecs_task_definition" "this" {
  family                   = "sample_api"
  memory                   = 512
  cpu                      = 256
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "my-api"
      "image" : "615311846444.dkr.ecr.ap-south-1.amazonaws.com/test-docker-repo:latest",
      "portMappings" : [
        { containerPort = 8080 }
      ],
    }]
  )
}
