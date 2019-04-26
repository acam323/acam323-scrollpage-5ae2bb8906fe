class ContactMailer < ActionMailer::Base

  default to: 'adrian.camuti@yahoo.com'


    def new_contact(contact)
        @contact = contact
        @contact_name = contact.name
        @contact_email = contact.email
        @contact_body = contact.message
        
        mail(from: "#{@contact_email}", subject: "New message from: #{@contact_name}",
        body: "#{@contact_body}")
    end    
end
