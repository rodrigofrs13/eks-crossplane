import json
import boto3


def lambda_handler(event, context):
    # Imprime "Hello, World!" no CloudWatch Logs
    print("Hello, World!")
    
    # Retorna uma resposta (opcional)
    return {
        'statusCode': 200,
        'body': 'Hello, World!'
    }

	