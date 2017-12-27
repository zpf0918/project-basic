class User < ApplicationRecord
  before_save { self.email = email.downcase } #将地址中的字母转化为小写
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },#邮箱地址唯一，且要在数据库层面加上索引
                    format: { with: VALID_EMAIL_REGEX }, #邮箱格式，VALID_EMAIL_REGEX为常量
                    uniqueness: { case_sensitive: false } #邮箱地址唯一,不区分大小写
  validates :password, presence: true, length: { maximum: 6} #密码长度

  has_secure_password #安全密码

  # 返回指定字符串的哈希摘要
   def User.digest(string)
     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                   BCrypt::Engine.cost
     BCrypt::Password.create(string, cost: cost)
   end
end
