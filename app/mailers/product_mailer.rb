class ProductMailer < ApplicationMailer
  def notify_user
    @product = params[:product]
    @image = params[:host] + @product.image.url
    @name = @product.name
    @price = @product.price
    @category = @product.category
    @status = @product.is_status
    mail(to: @product.email, subject: 'Produk anda telah berhasil di tambahkan')
  end
end
