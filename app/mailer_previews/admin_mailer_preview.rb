class AdminMailerPreview 
  def new_orders                
    UserMailer.welcome_email User.new(username: 'name', email: "user#{rand 100}@test.com")                            
  end

  
end


