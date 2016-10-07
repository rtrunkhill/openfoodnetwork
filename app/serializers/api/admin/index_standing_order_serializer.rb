class Api::Admin::IndexStandingOrderSerializer < ActiveModel::Serializer
  attributes :id, :item_count, :begins_on, :ends_on

  has_one :shop, serializer: Api::Admin::IdNameSerializer
  has_one :customer, serializer: Api::Admin::IdEmailSerializer # Remove IdEmailSerializer if no longer user here
  has_one :schedule, serializer: Api::Admin::IdNameSerializer
  has_one :payment_method, serializer: Api::Admin::IdNameSerializer
  has_one :shipping_method, serializer: Api::Admin::IdNameSerializer
  has_many :standing_line_items, serializer: Api::Admin::IdSerializer

  def item_count
    object.standing_line_items.sum(&:quantity)
  end

  def begins_on
    object.begins_at.strftime('%b %d, %Y')
  end

  def ends_on
    object.ends_at.andand.strftime('%b %d, %Y') || I18n.t(:ongoing)
  end
end