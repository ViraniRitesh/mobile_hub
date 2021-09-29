class PostmanMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postman_mailer.purchase_complete.subject
  #
  def purchase_complete(data,amount,cart)
    @email=data.email 
    @amount=amount
    @cart=cart
    mail(:to=>@email, :subject=>"Order Confirmed")
  end
end
