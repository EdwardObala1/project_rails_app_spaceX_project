## RAILS PROJECT
### SPACE LAUNCH TRACKING AND LEARNING PLATFORM
___

<img src="./app/assets/images/starship.gif"  width="500" >

___

#### Project Details

* The project is a rails app that will act as a forum and an information hub for space related content
 
* The App is built on the following stack

    * Rails (v 6.1.4)
    * Ruby (v 3.0.2)
    * Postgres
    * RSpec
    * Factory bot
    * Docker

* The services offered are
    * Mailing service
    * Authentication with Devise
    * Data streaming from spaceX
    * Youtube vide embedding

* To run the application on docker you have to run the following commands
    * docker-compose build
    * docker-compose up

#### Development Notes
    - set up a default url for devise mailer in prod and staging environment
    - remember to set up actual hostss on the production.rb for the sake of the devise gem
    `config.action_mailer.default_url_options = { host: '####Put in Current Host####', port: 3000 }`
    - configure faveicon.ico for browsers
    - write about the testing
    - write about the .env file

