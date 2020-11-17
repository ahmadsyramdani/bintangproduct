<!-- ABOUT THE PROJECT -->
## About The Project

Simple Product CRUD

The main feature for this project is:
- Rspec test sample
- Active Job with sidekiq & redis
- Mailer
- Action Cable (need to improve)

### Built With
* [Rails 5.2.4.3](https://guides.rubyonrails.org/v5.2/)
* [Jbuilder](https://github.com/rails/jbuilder)



<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Install Ruby & Rails
2. Clone the repo
```sh
$ git clone git@github.com:ahmadsyramdani/bintangproduct.git
```
3. Go to project path
```sh
$ cd bintangproduct
```
4. Install Packages
```sh
$ bundle install
```
5. Create database & migrate
```sh
copy .env.example to .env
$ rake db:create && rake db:migrate
```
6. Install postman & import 'warehouse.postman_collection.json' file


<!-- USAGE EXAMPLES -->
## Run
### Sidekiq
```sh
$ sidekiq
```

### Redis
```sh
$ redis-server
```

### Mailcatcher
```sh
$ gem install mailcatcher
$ mailcatcher
```
and open on browser http://127.0.0.1:1080/

### Run app
```sh
$ rails s -p3090
```
Open postman and run each requests

## TEST
### Running Test

```sh
$ bundle exec rspec spec/
```
### Coverage
Open file `coverage/index.html`


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

Ahmad - ahmadsyaripramdani@gmail.com
