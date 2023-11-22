To ran use the following commands:

```shell
aws lambda invoke --region=us-east-1 --function-name=$(terraform output -raw function_name) response.json
```
