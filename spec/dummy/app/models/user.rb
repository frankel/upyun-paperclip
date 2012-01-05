class User < ActiveRecord::Base
  attr_accessible :name
  
  has_attached_file :avatar,
  { 
    :storage => :upyun, 
    
    # To run this test, please set the correct options.
    :upyun_bucketname => 'bucketname',
    :upyun_username => 'username',
    :upyun_password => 'password',
    :upyun_domain => 'domain',
    
    
    # :url => "/system/images/:hash.:extension",
    # :hash_secret => "SKDLJKLJKIIoiuoijksdfjjiJIOJLKJKJjlkj",
    # :use_timestamp => false,
    
    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  }
end
