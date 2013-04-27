 ActionMailer::Base.smtp_settings = {
  :address              => "mail.lainadelgaza.net",
  :port                 => 25,
  :domain               => "lainadelgaza.net",
  :user_name            => "sacian@lainadelgaza.net",
  :password             => "sacian589",
  :authentication       => "plain",
  :enable_starttls_auto => false
}

ActionMailer::Base.default_url_options[:host] = "www.lainadelgaza.net"
