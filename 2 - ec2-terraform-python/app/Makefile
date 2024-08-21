app:
	@docker container run -it --rm -w /app -v $$(pwd)/:/app python:3.12.5-bullseye bash

start:
	@flask --debug --app main run --port 3000 --host 0.0.0.0