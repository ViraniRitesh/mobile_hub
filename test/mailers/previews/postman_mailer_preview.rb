# Preview all emails at http://localhost:3000/rails/mailers/postman_mailer
class PostmanMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/postman_mailer/purchase_complete
  def purchase_complete
    PostmanMailer.purchase_complete
  end

end
