## Setup:

### Clone the repo:

```
git clone git@github.com:guilherme-andrade/recruitr.git
cd recruitr
```

<br>

### Install all dependencies:

```
bundle install
yarn install
```

<br>

### Setup the Database

```
rails db:create db:migrate db:seed
```
> 📝 *The seeds replicate pretty much the whole application logic, so `db/seeds.rb` is a good basis to understand the app.*

<br>

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

<br>

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
- `Bootstrap 5` - for styles

These 4 libraries in conjunction make it so that the usual Rails views are better organized, and faster than a virtual DOM, at a fraction of the effort.

<br>

## The Back End:

Here I used:

- `Interactor` - an improved service-like abstraction
- `GoogleApiClient` - to access google calendar


<br>

## Demo

You can see find video demo [here](https://www.loom.com/share/01707ae7a99942979a006280f91c2cba).

The views are based on the screenshots from the project description and allow a user to:

- Login/Register.
- View all Job Offers.
- Create a new Job Offer.
- View a Job Offer and all its applications.
- Add existing or new applicants to a job offer.
- View a candidate and all its applications.
- Create appointments between recruiters and applicants regarding a specific job offer.
- Send Calendar invites to both the Recruiter and Applicant.

In the last point, I adapted the logic slightly, by automatically selecting the **available recruiter** that has the **most skills** in common with the Job Offer.

This logic is present in the [`OrganizeAppointment`](https://github.com/guilherme-andrade/recruitr/blob/master/app/interactors/organize_appointment.rb) organizer and it's organizers.


<br>

## Given more time, what would I have done better?

> *These are things that are simple for the most part, and I made the choise to leave them out of the specs.*

1. Add validations to models.
2. Add flash messages for user feedback.
3. Stub the GoogleApiServices so you could run it in your environment without my credentials - this I just forgot to be honest, would've been cool to do.
4. The overall style is messy.
5. Add some more context failures to interactors.
6. Stub Mailers.
7. Remove more unused files and gems - I used this [boilerplate](https://github.com/guilherme-andrade/boilerplates/tree/master/sheen) I created and, at first, I scaffolded some useless controllers which was a mistake.
