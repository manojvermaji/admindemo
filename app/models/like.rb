class Like < ApplicationRecord
  belongs_to :user
  belongs_to :share

 
  # def like
  #   self.share.likes_count += 1
  #   self.share.save
  # end

  def like
    self.share.likes_count ||= 0  
    self.share.likes_count += 1
    self.share.save
  end
  

  def unlike
    self.share.likes_count -= 1
    self.share.save
  end
end
