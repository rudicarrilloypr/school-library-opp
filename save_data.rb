require_relative 'storage'
require_relative 'app'

class SaveData
  include Storage

  def initialize(app)
    @app = app
  end

  def save
    create_storage_directory unless storage_directory_check?
    app_arrays = %w[persons books rentals]

    app_arrays.each do |file|
      data = @app.instance_variable_get("@#{file}")
      if data.nil?
        puts "ERROR: #{file.capitalize} data is nil!"
      else
        json_data = data.map(&:to_hash)
        create_file(file, json_data)
      end
    end
    puts 'Thank you for using this app!'
  end
end
