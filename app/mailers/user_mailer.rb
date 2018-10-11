class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: 'Order No. is #{@order.id}')
  end
end
