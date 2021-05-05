class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(magazine_id: magazine.id, price: price, 
      reader_id: self.id)  
  end

  def total_subscription_price
    prices = self.subscriptions.map do |sub_instance|
      sub_instance.price
    end
    prices.sum { |obj| obj }
  end

  def cancel_subscription(magazine)
    canceled_sub = Subscription.find_by(magazine_id: magazine.id, reader_id: self.id)
    canceled_sub.destroy
  end

end