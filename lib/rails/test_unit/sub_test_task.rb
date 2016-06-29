# Monkey patch: waiting for Draper to be full comptable with Rails 5
# Related issue: https://github.com/drapergem/draper/issues/681
class Rails::SubTestTask < Rake::TestTask
end