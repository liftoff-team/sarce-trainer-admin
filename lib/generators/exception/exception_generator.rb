class ExceptionGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    file_name.gsub! "_exception", ""
    class_path.delete("sarce")

    if class_path.empty?
      exception_file_path = "app/exceptions/sarce/#{file_name}_exception.rb"
    else
      exception_file_path = "app/exceptions/sarce/#{class_path.join('/')}/#{file_name}_exception.rb"
    end

    copy_file "exception.rb", exception_file_path

    gsub_file exception_file_path, "_ExceptionName_", class_name
  end
end
