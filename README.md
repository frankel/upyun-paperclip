# UpYun Storage engine for paperclip

This gem allows you to use [UpYun Storage](http://www.upyun.com) as storage engine for [paperclip](https://github.com/thoughtbot/paperclip)

## Installation

    gem install upyun-paperclip
    
## Rails 3

    gem "upyun-paperclip", "~> 0.1.3"
    
## Usage

For example, if you have a model named User, then you can 

```ruby
class User < ActiveRecord::Base  
  has_attached_file :avatar,
  { 
    :storage => :upyun, 

    # Please set these four options found in your upyun account.
    :upyun_bucketname => 'bucketname',
    :upyun_username => 'username',
    :upyun_password => 'password',
    :upyun_domain => 'domain',
    
    # Set any other options according to paperclip
    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  }
end
```

