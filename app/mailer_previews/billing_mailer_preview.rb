class BillingMailerPreview 
  def receipt                
    UserMailer.welcome_email User.new(username: 'name', email: "user#{rand 100}@test.com")                            
  end

  
end


