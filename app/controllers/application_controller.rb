class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate!
end
