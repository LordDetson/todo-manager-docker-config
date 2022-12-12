# todo-manager-docker-config
Config to automatically setup CI/CD on docker for todo manager app

```
docker run -d -p 8081:8080 -p 50001:50000 -v "//c/Users/baban/jenkins_home_test:/var/jenkins_home" --network todo-manager-docker-config_sonarnet --env JENKINS_ADMIN_LOGIN=admin --env JENKINS_ADMIN_PASSWORD=admin --env SONAR_QUBE_TOKEN=<TOKEN> jenkins/todo
```
есть проблема с тем что casc.yaml стирается по какой-то причине

следующая команда избегает этой проблемы
```
docker run -d -p 8081:8080 -p 50001:50000 --network todo-manager-docker-config_sonarnet --env JENKINS_ADMIN_LOGIN=admin --env JENKINS_ADMIN_PASSWORD=admin --env SONAR_QUBE_TOKEN=<TOKEN> jenkins/todo
```
