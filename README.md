# UpYun Storage engine for paperclip

This gem allows you to use [UpYun Storage](http://www.upyun.com) as storage engine for [paperclip](https://github.com/thoughtbot/paperclip)

## Installation

    gem install upyun-paperclip
    
## Rails 3

    gem "paperclip"
    gem "upyun-paperclip", :git => 'git://github.com/frankel/upyun-paperclip.git'
    
## Usage

If you have a model named User, then you can set options like this.

### One model

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
### Multiple models

If you have more than one model to use paperclip, and feel bored to set the same options for each one, you can create a file named `paperclip.rb` under `config\initializers` folder, and write code like this:

```ruby
Paperclip::Storage::Upyun::Config = { 
  :upyun_bucketname => 'bucketname',
  :upyun_username => 'username',
  :upyun_password => 'password',
  :upyun_domain => 'domain'
}
```

and only set `:storage => :upyun` in each models.
