require 'erb'
require 'yaml'

module Base
  config_yml = File.expand_path(File.join('config.yml'))
  config_doc = ERB.new(IO.read(config_yml)).result
  config = YAML.load(config_doc)

  current_env = ENV.fetch('APP_ENV') { 'development' }
  current_config = config[current_env]

  Config = current_config
end
