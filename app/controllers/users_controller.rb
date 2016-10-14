class UsersController < ApplicationController
  
  def new
  end

  def create
    mailchimp_register(params[:name], params[:email], params[:phone], params[:message], params[:country], params[:contact])   
  end

  def mailchimp_register(name, email, phone, message, country, contact)
  	gb = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    begin

    	gb.lists(ENV['MAILCHIMP_LIST_ID']).members.create(body: {
          :email_address => email, 
          :status => "subscribed", 
          :merge_fields => {FNAME: name, PHONE: phone, MESSAGE: message, COUNTRY: country, CONTACT: contact }})

		rescue Gibbon::MailChimpError => e
      error = e.status_code == 214 ? "#{email} is already subscribed" : e.message
  		flash[:error] = error
      redirect_to new_user_path
    else
      flash[:notice] = "Message sent succesfully"
      redirect_to new_user_path
		end
      
  end

end
