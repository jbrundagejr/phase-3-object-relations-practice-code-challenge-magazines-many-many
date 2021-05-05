class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    emails_array = self.readers.map do |reader_instance|
      reader_instance.email
    end
    emails_array.join(";")
  end

  def self.most_popular
  #   ordered_arrays = Magazine.all.map do |mag_instance|
  #     mag_instance.subscriptions 
  #   end
  #   longest_r = ordered_arrays[0]
  #   ordered_arrays.each do |ordered_array|
  #     if ordered_array.count > longest_r.count
  #       longest_r = ordered_array
  #     end
  #   end
  #   longest_r[0].magazine
  # end
    Magazine.all.max_by do |mag_instance|
      mag_instance.subscriptions.count
    end
  end

end