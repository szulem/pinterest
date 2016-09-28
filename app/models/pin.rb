class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :big => "800x800>", :medium => "300x300>", :small => "150x150>", :thumb => "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
