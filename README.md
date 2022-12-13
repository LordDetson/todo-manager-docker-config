# todo-manager-docker-config
Config to automatically setup CI/CD on docker for todo manager app

## Steps:
1. Go to `sonarqube-docker-compose` folder
2. Run `docker-compose up -d` to run SonarQube
3. Go to http://localhost:9000/
4. Login as `admin`
5. Update your password
6. Go to `Administration > Security > Users > Administrator > Tokens`
7. Create and copy new token
8. Go to `jenkins-image` folder
9. Run the following command to build image

```
docker build -t jenkins/todo-manager .
```

9. Run the following command with copid token to run a container based on the created image

```
docker run -d -p 8080:8080 -p 50000:50000 --network sonarqube-docker-compose_sonarnet --env JENKINS_ADMIN_LOGIN=admin --env JENKINS_ADMIN_PASSWORD=admin --env SONAR_QUBE_TOKEN=<TOKEN> jenkins/todo-manager
```

> Warning! Do not mount the volume with the folder on the local machine. For some reason the casc.yaml file is not being copied or deleted. Finding out the reasons.

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

## Links

- This CI/CD config repository is connected to [LordDetson/todo-manager-core](https://github.com/LordDetson/todo-manager-core), [LordDetson/todo-manager-swing](https://github.com/LordDetson/todo-manager-swing), [LordDetson/todo-manager-api](https://github.com/LordDetson/todo-manager-api)
