class StaticGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :page_name, type: :string
  class_option :path, type: :string, default: 'app/views/pages', description: 'Path to save page, Default: app/views/pages'
  class_option :branch, type: :string, default: '', description: 'Git branch name. Creates branch if branch_identifier specified'

  def generate_static
    @file_name = page_name.parameterize('_')
    @file_path = File.join(options.path, @file_name + '.html')

    template "static_page.html", @file_path
    update_route
    create_branch unless options.branch.blank?
  end

  private

  def update_route
    new_route = sprintf("get 'pages/%s' => 'high_voltage/pages#show', id: '%s'", @file_name, @file_name)

    # Extract the contents of the routes file
    r = ""
    File.open("config/routes.rb") do |routes_file|
      while (line = routes_file.gets) do
        r << line
      end
    end

    # Insert in the new route entry before the last end statement
    File.open("config/routes.rb", "w") do |routes_file|
      routes_file.write(r.gsub(/(\n\s*end\s*)$/m,"\n  #{new_route}\\1"))
    end
  end

  def create_branch
    branch_name = "#{options.branch}-#{page_name.gsub(/ /, '_')}"
    puts "$ git flow feature start #{branch_name}"
    puts "$ git commit -a -m 'Create static page \"#{page_name}\"'"
    puts "$ git flow feature publish #{branch_name}"
    puts "Edit file at https://github.com/tulibraries/tul_ohist/tree/feature/#{branch_name}/#{@file_path}"
  end
end
