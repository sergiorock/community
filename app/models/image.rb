class Image < ApplicationRecord
  has_attached_file :picture, :styles => {
  :tiny => "25x25#",
  :thumbnail => "100x100#",
  :small  => "150x150>",
  :medium => "300x300>" },
  :default_url => "default.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
