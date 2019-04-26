class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
def home
    @contact = Contact.new
end

def new
end

def create
    @contact = Contact.new(contact_form_params) 
    
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      flash[:success] = "Your message has been sent."
      redirect_to root_path
    else
      flash.now[:danger] = "Your message could not be sent based on the following:"
      render 'home'
    end
end


private
def contact_form_params
    params.require(:contact).permit(:name, :email, :message)
end    


end
