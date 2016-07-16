class ApplicationMailer < ActionMailer::Base
  default from: 'arlenglet@gmail.com'
  layout 'mailer'

  def subject(content)
    "Sarce - #{content}"
  end
end
