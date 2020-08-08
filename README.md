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

This logic is present in the [`OrganizeAppointment`](https://github.com/guilherme-andrade/recruitr/blob/master/app/interactors/organize_appointment.rb) organizer and it's interactors.


<br>

## What should you spend the most time Reviewing?

In my opinion, following files/folders:

- [app/components/applicants/applications_table/application_component.rb](https://github.com/guilherme-andrade/recruitr/blob/master/app/components/applicants/applications_table/application_component.rb)
- [app/components/job_offers/applications_table/application_component.rb](https://github.com/guilherme-andrade/recruitr/blob/master/app/components/job_offers/applications_table/application_component.rb)
- [app/interactors](https://github.com/guilherme-andrade/recruitr/tree/master/app/interactors)
- [app/services/google_calendar](https://github.com/guilherme-andrade/recruitr/tree/master/app/services/google_calendar)
- [db/seeds.rb](https://github.com/guilherme-andrade/recruitr/blob/master/db/seeds.rb)
- [db/migrations](https://github.com/guilherme-andrade/recruitr/blob/master/db/migrations)

<br>

## Given more time, what would I have done better?

I realized now, that I spent maybe too much time on the Google Api stuff and that much time could have also been saved by not using interactors, since they ended up being so slim.

Even worse than that was actually completely forgetting about the score card.

### How I would've added score cards.

- [x] Add another model called `Review` (or similar), that `belongs_to` to an `Applicant` and a `polymorphic` `reviewer` (that could be either a `User` (HR agent) or a `Recruiter`).
- [x] This `Review` model would have the fields mentioned in the project brief `experience`, `dynamism`, `interest_in_the_company` as `Integer` fields.
- [x] A virtual attribute `score_card` would be added to `Applicant` to hold the averages of each of these the `Review` fields.
- [x] The `score_card` would be displayed in the `Applicants#show` using `GraphJS` and each `Review` created in `Reviews#new`.

> *[Edit on 08/08/2020] - Added some (still buggy) score cards, as you can see [here](https://www.loom.com/share/b54b7fbe56844caf88049fa66e3e0613))*


### Other things.

- [x] Add validations to models.
- [ ] Added seniority level to all [`Skillable`](https://github.com/guilherme-andrade/recruitr/blob/master/app/models/concerns/skillable.rb) models.
- [ ] Added Applicant Scorecard to applicants, and views for post appointments.
- [ ] Add flash messages for user feedback.
- [ ] Stub the GoogleApiServices so you could run it in your environment without my credentials - this I just forgot to be honest, would've been cool to do.
- [ ] The overall style is messy.
- [ ] Add some more context failures to interactors.
- [ ] Stub Mailers.
- [ ] Remove more unused files and gems - I used this [boilerplate](https://github.com/guilherme-andrade/boilerplates/tree/master/sheen) I created and, at first, I scaffolded some useless controllers which was a mistake.
