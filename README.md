## Setup:

### Clone the repo:

```
git clone git@github.com:guilherme-andrade/test_app.git
cd recruitr
```

### Install all dependencies:

```
bundle install
yarn install
```

### Setup the Database

```
rails db:create db:migrate db:seed
```
> 📝 *The seeds replicate pretty much the whole application logic, so `db/seeds.rb` is a good basis to understand the app.*

### Run the application

```
foreman start
```
> 📝 *Foreman uses a simple Procfile configuration to start all required runtime processes, apart from the postgres database.*

<br>
<hr>
<br>

## Authentication:

Since I went for a full-stack Rails approach, I used a simple devise authentication scheme, with little to no modification. In the case the application was a simple API, I would've kept the authentication to a minimal JWT approach.


### To log in

```
email: fake_hr@gmail.com
password: 123456
```

<br>
<hr>
<br>

## The Views:

In this application the following libraries were used on top of ActionView:

- `ViewComponent` - much like any other presenter, decorator library.
- `StimulusJS` - Basecamp's lightweight JS framework
- `StimulusReflex` - a rapidly growing Rails library based on Phoenix's Live View built on top of Morphdom, Stimulus and CableReady.
- `ViewComponentReflex` - a library to add StimulusReflex to ViewComponents.

These 4 libraries in conjunction make it so that the usual Rails views are better organized, and faster than a virtual DOM, at a fraction of the effort.


## The Back End:

Here I used:

- `Interactor` - an improved service-like abstraction
- `GoogleApiClient` - to access google calendar
