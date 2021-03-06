class ImageUploader < CarrierWave::Uploader::Base
  
  storage :fog
  
  include CarrierWave::MiniMagick

  process :resize_to_fit => [400, 400]
    
  def extension_white_list
    %w(jpg jpeg png gif)
  end
  
  def fix_exif_rotation #this is my attempted solution
    manipulate! do |img|
      img.tap(&:auto_orient)
    end
  end

  process :fix_exif_rotation

end
