dev:
	@docker-compose build
	@docker-compose up

test:
	@docker exec -it power-contact-api_app_1 bundle exec rspec
