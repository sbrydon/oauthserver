# oauthserver

OAuth server built with Spring Boot

* `spring-boot-starter-security` for registering and logging in

* `spring-security-oauth2` for creating client details and access tokens

* `spring-boot-starter-data-jpa` + `PostgreSQL` for persisting both

A contrived example where a user registers / logs in then creates an 'App', 
specifying 'Client ID' and 'Client Secret' in order to later generate access tokens with the
`client_credentials` grant type

The database is automatically created and seeded with `schema.sql`. See `application.yml` for connection settings
