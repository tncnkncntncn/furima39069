class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :region
  belongs_to :day_to_ship
  has_one :order
  has_one_attached :image
  belongs_to :user


  validates :category_id,:condition_id,:shipping_id,:region_id,:day_to_ship_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :name,:description,:image, presence: true

end