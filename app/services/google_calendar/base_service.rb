require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"

class GoogleCalendar::BaseService < ApplicationService
  OOB_URI          = "urn:ietf:wg:oauth:2.0:oob".freeze
  APPLICATION_NAME = "Google Calendar API Ruby Quickstart".freeze
  CREDENTIALS_PATH = "config/credentials.json".freeze
  TOKEN_PATH       = "config/token.yml".freeze
  SCOPE            = Google::Apis::CalendarV3::AUTH_CALENDAR
  TIME_ZONE        = Time.zone.name
  DATE_FORMAT      = '%FT%T%:z'

  def self.call(*args)
    super(*args)
  rescue Google::Apis::AuthorizationError => e
    @errors << 'Could not authenticate, please check your credentials.'
  rescue Google::Apis::ClientError => e
    @errors = [e]
  end

  # could be changed to an ActiveSupport::Callback
  def before_call
    authorize
  end

  def authorize
    @service                                 = Google::Apis::CalendarV3::CalendarService.new
    client_id                                = Google::Auth::ClientId.from_file CREDENTIALS_PATH
    token_store                              = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer                               = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    user_id                                  = "default"
    credentials                              = authorizer.get_credentials user_id
    @service.client_options.application_name = APPLICATION_NAME
    @service.authorization                   = credentials
  end
end
