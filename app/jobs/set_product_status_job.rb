class SetProductStatusJob < ApplicationJob
  queue_as :default

  def perform(product)
    product.update(is_status: true)
    ProductMailer.with(host: ENV.fetch("HOST"), product: product).notify_user.deliver_now
  end
end
