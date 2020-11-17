class Product < ApplicationRecord
  paginates_per 10
  mount_uploader :image, ImageUploader

  validates :name, :price, :category, :image, :email, presence: true
  validates :email, email: true

  after_create :broadcast_notify

  private

  def broadcast_notify
    ActionCable.server.broadcast "global_room", message: "produk #{self.name} telah di tambahkan"
  end
end
