class UsersController < ApplicationController
  
  def new
  end

  def create
    mailchimp_register(params[:name], params[:email])   
  end

  def mailchimp_register(name, email)
  	gb = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    begin

    	gb.lists.members.create(body: {
          :email_address => email, 
          :status => "subscribed", 
          :merge_fields => {FNAME: name},
          :double_optin => false,
          :send_welcome => true})

		rescue Gibbon::MailChimpError => e
      error = e.code == 214 ? "#{email} is already subscribed" : e.message
  		flash[:error] = error
      redirect_to new_user_path
    else
      flash[:notice] = "Message sent succesfully"
      redirect_to new_user_path
		end
      
  end

end
