# encoding: utf-8

class CocktailUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :standard do
    cloudinary_transformation width: 300, height: 250, crop: :fill
  end

  version :landscape do
    cloudinary_transformation width: 1200, height: 500,  crop: :fill
  end

end
