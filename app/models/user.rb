class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  #def current_cart=(current_cart)
  #  @current_cart = current_cart
  #  if @current_cart != nil
  #    self.current_cart_id = @current_cart.id
  #  end
  # end

  #def current_cart
  #  @current_cart 
  #end
end
