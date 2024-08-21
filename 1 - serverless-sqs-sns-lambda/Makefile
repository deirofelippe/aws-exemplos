aws --endpoint-url http://localhost:4566 sns list-topics

aws --endpoint-url http://localhost:4566 sns publish \
	--message "{ \"client_id\": 100, \"items\": [ {\"name\": \"product 1\", \"price\": 10}, {\"name\": \"product 2\", \"price\": 25.5} ] }" \
	--topic-arn "arn:aws:sns:sa-east-1:000000000000:OrdersTopic"

aws --endpoint-url http://localhost:4566 sqs list-queues

aws --endpoint-url http://localhost:4566 sqs receive-message --queue-url "http://sqs.sa-east-1.localhost.localstack.cloud:4566/000000000000/OrdersQueue"