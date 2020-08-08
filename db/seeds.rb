User.destroy_all
Review.destroy_all
Appointment.destroy_all
Application.destroy_all
JobOffer.destroy_all
Recruiter.destroy_all
Applicant.destroy_all

JOB_OFFERS = ['Front-End Developer', 'Back-End Developer', 'Marketing Content Writer', 'Mobile Developer'].freeze

hr_agent = User.create(
  email:      'fake_hr@gmail.com',
  password:   '123456',
  first_name: 'Toby',
  last_name:  'Flenderson'
)

JOB_OFFERS.each do |offer_name|
  job_offer = JobOffer.create(
    name:                 offer_name,
    skill_list:           JobOffer.skill_options.sample(rand(3..5)),
    seniority_level:      JobOffer.seniority_options.sample.last
  )

  recruiter = Recruiter.create(
    first_name:           Faker::Name.first_name,
    last_name:            Faker::Name.last_name,
    email:                'inbox@guilherme-andrade.com',
    skill_list:           Recruiter.skill_options.sample(rand(3..5)),
    seniority_level:      :master,
  )

  applicant = Applicant.create(
    first_name:           Faker::Name.first_name,
    last_name:            Faker::Name.last_name,
    email:                'inbox@guilherme-andrade.com',
    linkedin_profile_url: 'https://www.linkedin.com/in/guilherme-andrade-10b06510b/',
    angelist_profile_url: 'https://angel.co/u/guilherme-andrade-4',
    skill_list:           Applicant.skill_options.sample(rand(3..5)),
    seniority_level:      Applicant.seniority_options.sample.last
  )

  application = Application.create(
    job_offer:            job_offer,
    applicant:            applicant
  )
end

Application.find_each do |application|
  # find suitable recruiters for each application
  meeting_time = Time.zone.now + rand(1..4).days

  # OrganizeAppointment.call(
  #   application:    application,
  #   start_time:     meeting_time,
  #   end_time:       meeting_time + 1.hour
  # )
end

