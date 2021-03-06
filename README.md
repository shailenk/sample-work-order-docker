### Setup

Run the following commands to test or develop this project:

1. Clone this repository to your local developer workspace
```bash
git clone https://github.com/shailenk/openui5-sample-workorder-docker.git
cd openui5-sample-workorder-docker
```

2. Load npm dependencies without running their individual scripts
```bash
npm install
```

> *Note:* to test the deployment that is triggered via Travis call `npm run deploy`. All resources for deployment will be put in a subfolder `deploy`.
 

4. Run a local server for testing 
```bash
npm start
```

5. Go to [http://localhost:8080/test-resources/com/samples/SampleWorkOrder.html](http://localhost:8080/test-resources/com/samples/SampleWorkOrder.html) to display all available UI5Lab libraries
# Docker Deployement
Follow [Dockerizing a Node.js web app](https://nodejs.org/de/docs/guides/nodejs-docker-webapp/) to do the needed setup. I have done on windows machine. I have already created the needed dockerFile, server.js, .dockerignore and package.json files. So you need to start from step: [building-your-image](https://nodejs.org/de/docs/guides/nodejs-docker-webapp/#building-your-image)

There are 2 ways i have tried:
### Docker Deployement with dist folder only.
To use this, first you need to run the command for self-contained build.
#### Steps to create self contained build:
1. ```rm -rf ./dist```
2. ```npm install --global @ui5/cli```
3. ```npm install --global serve@6```
4. ```ui5 build self-contained --exclude-task=createDebugFiles replaceCopyright --include-task=generateLibraryPreload -a```

Step 4 creates a new dist folder, which will be copied to docker contained during build steps below:
1. Create container: ```docker build -t <your username>/sampleapp .```
2. Check in images: ```docker images``` you should see 2 containers, one for node and another for sampleapp.
3. Run ```docker run -p 49160:5000 -d <your username>/sampleapp``` to host your application on your port 49160.

### Docker Deployement with builds running on docker.
Before executing above 3 steps, you only need to rename existing Dockerfile to Dockerfile-old, and rename Dockerfile-all to Dockerfile or run:

``` mv Dockerfile Dockerfile-old ```

``` mv Dockerfile-all Dockerfile```
Now you can repeat the above 3 steps

Below are the details of your running docker container:
#### Get container ID
$ docker ps

#### Print app output
$ docker logs <container id>

#### Example: Log output
```Running on http://localhost:5000``` 

accessible on http://localhost:49160/test-resources/com/samples/SampleWorkOrder.html of your machine.
#### Enter the container
```$ docker exec -it <container id> /bin/bash```

### Useful Docker commands:
kill all running containers with ```docker kill $(docker ps -q)```

delete all stopped containers with ```docker rm $(docker ps -a -q)```

delete all images with ```docker rmi $(docker images -q)``` 
