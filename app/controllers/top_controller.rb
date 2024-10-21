class TopController < ApplicationController
    def main
        if session[:login_uid]
            redirect_to tweets_path
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid]) 
        if user and BCrypt::Password.new(user.pass) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error",status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end


#signup_password = BCrypt::Password.create("123")
#User.create(uid: "1", pass: signup_password)