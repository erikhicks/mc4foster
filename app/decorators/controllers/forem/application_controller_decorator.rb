Forem::ApplicationController.class_eval do
  before_filter :authenticate_user
end

def authenticate_user
  if !current_refinery_user
    redirect_to '/members/login?member_login=true&redirect=%2Fforums'
  end
end