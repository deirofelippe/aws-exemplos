EC2_URL=http://localhost:4566 ansible-playbook \
--connection=local create_iam_user_noparam.yml

ansible-playbook --connection=local create_iam_user.yml

tflocal init
tflocal plan
tflocal apply -auto-approve

docker compose up -d

aws dynamodb list-tables --endpoint-url http://localhost:4566
