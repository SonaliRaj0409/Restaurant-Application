class OrderMailer < ApplicationMailer
 default from: "mail@example.com"
 def order_send(order, user)
    @order = order
    @user = user
    mail(to: "#{@user.email}", subject: "Your subject")
 end
end