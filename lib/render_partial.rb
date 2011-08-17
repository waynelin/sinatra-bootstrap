# Borrowed from Tanner Burson: http://github.com/tannerburson
# http://github.com/adamstac/sinatra-plugins/blob/master/render_partial.rb

module Sinatra
  module RenderPartial
    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end
    
    def current?(path='')
        path.empty? ? path='/': path=path
        request.path_info==path ? 'current':  ''
    end
    
    def path()
        fullPath = request.path_info.split('/')
        fullPath.empty? ? fullPath << 'home' : fullPath = fullPath.drop(1)
        fullPath = fullPath.map {|path| 
          path.split('-').each do |part| part = part.gsub(/\W+/,'') end
        }
        return fullPath
    end
  end
 
  helpers RenderPartial
end