class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :statuses


  def status
    if !self.statuses.blank?
      self.statuses.last.status_label.html_safe
    else
      "<label class='label label-warning'>Sin actualizar</label>".html_safe
    end
  end
end
