require 'digest/md5'

module Jekyll
  module GravatarTag

    def pull_gravatar(mail)
      "//www.gravatar.com/avatar/#{hash(mail)}"
    end

    private :hash

    def hash(email)
      email_address = email ? email.downcase.strip : ''
      Digest::MD5.hexdigest(email_address)
    end
  end
end

Liquid::Template.register_filter(Jekyll::GravatarTag)