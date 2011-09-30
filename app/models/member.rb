class Member < ActiveRecord::Base
  has_and_belongs_to_many :products
  
  validates :email,   
            :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i }
                
  def registered=(value)
    write_attribute(:registered, value)
    if value == false
      self.reg_date = nil
    else
      self.reg_date = Time.now
    end
  end
  
  def offered?(offer)
    self.products.exists?(offer)
  end
  
  def modify_products(prods)
    prods.each do |k, v|
      if v == "1"
        prod = Product.find(k)
        self.products << prod unless self.products.exists? prod
      end
    end
  end
  
end
