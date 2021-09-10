require 'base_app'
class MyApp < BaseApp
  get '/' do
    locals = {
      content: "Welcome to Lark"
    }
    erb :welcome, :layout => :'base', :locals => locals
  end
end
