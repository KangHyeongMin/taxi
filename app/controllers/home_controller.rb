class HomeController < ApplicationController
    def index
    end
    
    def makeroom
    end
    
    def room
        @posts = Post.all
    end
    
    def send_msg
        p = Post.new
        p.content = params[:content]
        p.save
        
        
        Pusher['onlyone'].trigger('new_message', {
            msg: params[:content]
        })
        
        render :text => ""
    end

end
