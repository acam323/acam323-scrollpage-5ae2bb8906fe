require 'test_helper'

class ContactsTest < ActionDispatch::IntegrationTest
  test "post with no error" do
    contact = {contact:{name: "adrian", email: "test@test.com", message: "hello"}}
    get '/'
    assert_response :success
    post '/contact' , contact
    assert flash[:success]
    assert_redirected_to root_path
  end  
  
  test "post with error" do
    get '/'
    post '/contact', contact: {name: "",
                            email: "",
                            message: ""}
    assert flash[:danger]
  end  
end