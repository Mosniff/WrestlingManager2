class Championship < ApplicationRecord
  has_many :title_reigns

  def current_title_reign
    self.title_reigns.where(is_current: true).first
  end

  def title_holder
    self.current_title_reign.performer
  end

  def assign_title(performer)
    # %%TODO Can this be shortened with '!'?
    if self.current_title_reign
      self.current_title_reign.update(end_date: Time.now.to_date, is_current: false)
    end
    TitleReign.create(performer: performer, championship: self, start_date: Time.now.to_date, is_current: true)
  end
end
