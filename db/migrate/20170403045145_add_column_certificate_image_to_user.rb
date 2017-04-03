class AddColumnCertificateImageToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :certificate_image, :string 
  end
end
