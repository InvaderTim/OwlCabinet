class RenameServiceImageRef < ActiveRecord::Migration
  def change
  	rename_column(:services, :user_image, :image_ref)
  end
end
