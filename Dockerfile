FROM node:8
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
#COPY ui5.* ./

#RUN rm -rf ./dist
#RUN npm install --global @ui5/cli
RUN npm install --global serve@6
#RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY ./dist ./dist
# add contents to folder
#ADD src $HOME/src

#RUN ui5 build self-contained -a
EXPOSE 5000
CMD [ "serve", "./dist" ]