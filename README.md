# todo-manager-docker-config
Config to automatically setup CI/CD on docker for todo manager app

## Steps:
1. Run `run-sonarqube <db_user> <db_password> <db_name>` bash script to create and start sonarqube with postgres db
   - `<db_user>` is an optional parameter which is defined the name of the database user. By default, this is `root`.
   - `<db_password>` is an optional parameter which is defined the password of the database user. By default, this is `passw0rd`.
   - `<db_name>` is an optional parameter which is defined the name of the database. By default, this is `sonarqube`.
3. Go to http://localhost:9000/
4. Login as `admin`
5. Update your password
6. Go to `Administration > Security > Users > Administrator > Tokens`
7. Create and copy new token
8. Run `build-jenkins` bash script to build configured jenkins image if it's not there
9. Run `run-jenkins <sonar_token> <admin_name> <admin_password> <docker_hub_username> <docker_hub_password>` bash script to create and start configured jenkins
   - `<sonar_token>` is a required parameter
   - `<admin_name>` is a required parameter which is defined the name of the jenkins admin
   - `<admin_password>` is a required parameter which is defined the password of the jenkins admin
   - `<docker_hub_username>` is a required parameter which is defined the username of the DockerHub account
   - `<docker_hub_password>` is a required parameter which is defined the password of the DockerHub account
10. Go to http://localhost:8080/
11. Login as admin

Jenkins is already configured and ready to go

## Possible Improvements

- Automatically generate SonarQube token for Jenkins to run CI/CD with one script
- Reduce JVM size for Windows desktop app with `jlink`
- Set up core job so that it runs swing and api jobs
- Fix warnings in Jenkins
- Send the build of the desktop version of the application for download after the swing job is completed
- Create and deploy the docker image of the backend application version after the api job is completed
- Add triggers for jobs

## Set up db for ToDo Manager API

1. Run `run-mysql <db_root_password> <db_user> <db_password> <db_name>` bash script to create and start Mysql db for ToDo Manager API. 
   - `<db_root_password>` is an optional parameter which is defined the password of the database root user. By default, this is `passw0rd`.
   - `<db_user>` is an optional parameter which is defined the name of the database user. By default, this is `root`.
   - `<db_password>` is an optional parameter which is defined the password of the database user. By default, this is `passw0rd`.
   - `<db_name>` is an optional parameter which is defined the name of the database. By default, this is `sonarqube`.
   
   Also this script creates the following environment variables:
   - `DB_ROOT_PASSWORD` is `<db_root_password>`
   - `DB_USER` is `<db_user>`
   - `DB_PASSWORD` is `<db_password>`
   - `DB_NAME` is `<db_name>`

## Links

- This CI/CD config repository is connected to [LordDetson/todo-manager-core](https://github.com/LordDetson/todo-manager-core), [LordDetson/todo-manager-swing](https://github.com/LordDetson/todo-manager-swing), [LordDetson/todo-manager-api](https://github.com/LordDetson/todo-manager-api)
