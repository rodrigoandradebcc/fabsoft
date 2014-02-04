class Users::RegistrationsController < Devise::RegistrationsController
  
  skip_before_filter :verify_authenticity_token, :only => [:ipn_notification]
  before_filter :configure_permitted_parameters


  
  protected
   
  # my custom fields are :name, :heard_how
  # Strong parameters devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :login, :name, :type, :phone, 
  	:cellphone, :facebook, :rg, :cpf, :entry_date, :address, :role_ids, :roles, :twitter, :github, :gplus, :linkedin)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password,:login, :name, :type, :phone, 
  	:cellphone, :facebook, :rg, :cpf, :entry_date, :address, :role_ids, :roles, :twitter, :github, :gplus, :linkedin)
    end
  end

#### Login em diferentes áreas da aplicação ####
  def resource_name
     :user
   end
  
   def resource
     @resource ||= User.new
   end
  
   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end
##################################################

end