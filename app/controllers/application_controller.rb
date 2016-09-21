class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
	end

	def terms
	end

  def pricing
  end

  def login
  end

  def format_errors(error_messages)
    output = []
    error_messages.each {|k, v| output << "#{k.to_s.capitalize} #{v.join(", ")}."}
    output
  end
  
end
