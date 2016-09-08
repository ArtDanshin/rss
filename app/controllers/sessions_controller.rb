class SessionsController < ApplicationController
  def create
    if ldap_user = User.authenticate(params[:login], params[:pass])
      ldap_user = ldap_user.first
      user = User.find_or_create_by(login: params[:login], first_name: ldap_user.givenname, last_name: ldap_user.sn)
      session[:current_user_id] = user.id
    end

    redirect_to v1_nearest_courses_path
  end
end
