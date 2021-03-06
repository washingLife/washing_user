class Courier < ApplicationRecord
  has_and_belongs_to_many :stations

  has_many :deliver_waybills, as: :sender, class_name: Waybill
  has_many :pickup_waybills, as: :receiver, class_name: Waybill

  def to_s
    "Courier #{self.id}"
  end
end
