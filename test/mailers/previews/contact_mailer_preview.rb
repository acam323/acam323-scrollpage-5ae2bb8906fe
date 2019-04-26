# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactMailerPreview < ActionMailer::Preview
    def contact
        contact = {name: "Bob", email: "test@test.com", message: "This is a test message"}
        ContactMailer.new_contact(contact)
    end    
end
