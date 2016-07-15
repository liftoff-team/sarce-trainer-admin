class ApplicationMailer < ActionMailer::Base
  default from: 'arlenglet@gmail.com'
  layout 'mailer'
end

def subject(content)
    "Sarce - #{content}"
  end
end
