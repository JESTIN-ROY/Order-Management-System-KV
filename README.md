# Order Management System in RoR - KV

DataBase Requirements: <a href="https://keyvalue.atlassian.net/wiki/spaces/TECH/pages/182321246/Database+details" target="_blank">DB Confluence Link</a>

API Requirements: <a href="https://keyvalue.atlassian.net/wiki/spaces/TECH/pages/182353967/API+Requirements" target="_blank">API Confluence Link</a>

**Ruby Version  : 3.2.2**

**Rails Version : 7.0.8**

**Database      : PostgreSQL**


## Quickstart

1. Install `Dev Containers` extension in vscode. (For development using docker)


2. Git clone the repo
    
    ```git clone https://github.com/sooraj-keyvalue/rest-api-ror-boilerplate.git```
3. Install initial dependencies
    
    ```bundle install```
4. Setup pre-commit hooks
    
    ```overcommit -s```
5. Setup environment variables: Change the values according to your requirement by editting the setenv.sh file
   
   ```sh setenv.sh```
6. Build docker images for postgresql and app
   
    ```docker-compose build```
7. Create db for the project
    
    ```docker-compose run app bundle exec rake db:create```
8. Start the application 
    
    ```docker-compose up -d```
9. In VSCode press `ctl+shift+p` and type `dev container`. Select the option `Attach to running container`. Last option in the image below. And continue development in the new vscode window.


