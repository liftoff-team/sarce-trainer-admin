class ServiceGenerator < Rails::Generators::NamedBase
  source_root(File.expand_path('../templates', __FILE__))

  def copy_initializer_file
    if class_path.empty?
      service_file_path = "app/services/#{file_name}_service.rb"
      service_spec_file_path = "spec/services/#{file_name}_service_spec.rb"
    else
      service_file_path = "app/services/#{class_path.join('/')}/#{file_name}_service.rb"
      service_spec_file_path = "spec/services/#{class_path.join('/')}/#{file_name}_service_spec.rb"
    end

    copy_file("service.rb", service_file_path)
    copy_file("service_spec.rb", service_spec_file_path)

    gsub_file(service_file_path, "{ServiceName}", class_name)
    gsub_file(service_spec_file_path, "{ServiceName}", class_name)
    gsub_file(service_file_path, "{model_name}", file_name)
    gsub_file(service_spec_file_path, "{model_name}", file_name)
  end
end
