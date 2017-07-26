class Link < ApplicationRecord

  def generate_short_url
    self.short_url = self.id.to_s(36)
    self.save
  end

  def display_short_url
    self.short_url =  self.id.to_s(36)
    self.save
  end

end
