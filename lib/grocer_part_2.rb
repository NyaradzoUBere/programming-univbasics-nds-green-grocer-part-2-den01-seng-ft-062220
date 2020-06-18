require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
    coupons.each do |coupon| 
    coupon.each do |key, value| 
      name = coupon[:item] 
    
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
          :clearance => cart[name][:clearance], :count => 1} 
        end 
  
      cart[name][:count] -= coupon[:num] 
    end 
  end 
end 
  cart 
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item, key_hash| 
    if key_hash[:clearance] == true 
      key_hash[:price] = (key_hash[:price] *
      0.8).round(2) 
    end 
  end 
cart 
end


def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  sum = 0 
  new_cart = consolidate_cart(cart) 
  coupon_cart = apply_coupons(new_cart, coupons) 
  clearance_cart = apply_clearance(coupon_cart) 
  clearance_cart.each do |item, key_hash| 
    sum += (key_hash[:price] * key_hash[:count])
  end 
sum = (sum * 0.9) if sum > 100
sum 
end

