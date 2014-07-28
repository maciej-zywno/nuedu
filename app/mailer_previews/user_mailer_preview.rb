class UserMailerPreview 
  def welcome                
    UserMailer.welcome_email User.new(username: 'name', email: "user#{rand 100}@test.com")                            
  end

  def latest_news                
    UserMailer.welcome_email User.new(username: 'name', email: "user#{rand 100}@test.com")                            
  end

  def voucher     
    UserMailer.welcome_email User.new(username: 'name', email: "user#{rand 100}@test.com")                            
  end

  private
  def mock_user(name = 'Bill Gates')
    fake_id User.new(username: name, email: "user#{rand 100}@test.com")
  end

  def fake_id(obj)
    # overrides the method on just this object
    obj.define_singleton_method(:id) { 123 + rand(100) }
    obj
  end
end


