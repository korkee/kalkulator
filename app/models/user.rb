class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
         has_many :meals
         
         def admin?
           role.to_sym == :admin
         end
         
         def user?
           role.to_sym == :user
         end
end
