class UserMailerPreview 
  def welcome                
    UserMailer.welcome_email mock_user                            
  end

  private
  # You can put all your mock helpers in a module
  # or you can use your factories / fabricators, just make sure you are not creating anythin
  def mock_user(name = 'Bill Gates')
    fake_id User.new(username: name, email: "user#{rand 100}@test.com")
  end

  def fake_id(obj)
    # overrides the method on just this object
    obj.define_singleton_method(:id) { 123 + rand(100) }
    obj
  end

end


