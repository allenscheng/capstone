class DailyDeal < ApplicationRecord
  belongs_to :user 

  def as_json 
    {
      id: id,
      user_id: user_id, 
      deal_name: name,
      description: description,
      color: color,
      price: price, 
      product_link: product_link
    }    
  end
end
