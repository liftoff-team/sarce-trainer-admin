#
# Service Object Class
# Manage {ServiceName}
#
class {ServiceName}Service

  def initialize(params)
    @{model_name} = params[:{model_name}]
  end

  def say_hello(name)
    "Hello, #{name} from {ServiceName}Service!"
  end

end