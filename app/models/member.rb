class Member < ActiveRecord::Base
  has_and_belongs_to_many :products
  
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
