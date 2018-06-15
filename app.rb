require "sinatra/base"

class App < Sinatra::Base
  set :erb, :escape_html => true

  def title
    "My App"
  end

  get "/" do
    erb :index
  end
  
  post "/" do
    @path = Pathname.new(params[:file]).expand_path
    if @path.exist?
      redirect to("/")
    else
      @error = "The path '#{@path}' does not exist."
    end
    erb :index
  end
  
end
