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
    * whne building the docker container for the first time or after making changes run the following
       *  `docker-compose up --build`
    * generally run `docker-compose up` to run the app

    * Then run the following to run all the database migrations
        `docker-compose run rails rake rb:migrate`
    * To use the interactive shell of the docker container of choise either the db or rails app run
        ```
        docker ps

        ## copy the container id number from the output

        run  "docker exec -it {CONTAINER_ID} /bin/bash"
        ```

* Open the app on your localhost port **3002**

* to run all the tests in rspec run
   * `docker-compose run rails bundle exec rspec`

#### Development Notes
- Testing was carried out using rspec and with heavy emphasis on practicing Test Driven Development
- Rspec configurationns were changed for ideal testing routines and adding formating to read the documentation better
- Feature isolation was also observed with relevant features having their own branch on the github repository
- Coupling of Controllers, Models was avoided with complete component isolation
- The development cycle was an iterative cycle especially with the testing being carried out write before running a feature and doing the same constantly
- API Keys are secured in private .env files for any need for the .env please reach out to me or generate a similar api key at the [Nasa Api Site]('https://api.nasa.gov/') or the [Google Developer Site](https://developers.google.com/) and get the youtube v3 api secret keys
- This was enabled with the debugging tool pry
- API Keys are secured in private .env files for any need for the .env please reach out to me or generate a similar api key at the [Nasa Api Site]('https://api.nasa.gov/') or the [Google Developer Site](https://developers.google.com/) and get the youtube v3 api secret keys

**Note** here are all the images of the application at this early stage
[test](./images)

