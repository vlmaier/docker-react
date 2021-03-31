FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD npm run build
 
FROM nginx
# Important for AWS Elastic Beanstalk
EXPOSE 80
# 0 stands for phase 0 (FROM node:alpine AS 0) 
COPY --from=0 /app/build /usr/share/nginx/html