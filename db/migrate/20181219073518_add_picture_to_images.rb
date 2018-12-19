class AddPictureToImages < ActiveRecord::Migration[5.2]
  def change
    add_attachment :images, :picture
  end
end
