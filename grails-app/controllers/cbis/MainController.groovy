package cbis

class MainController {

    def authenticate={
        if(!params.userName){
            flash.message="请输入用户名"
            redirect(controller:"user",action:"login")
        }
        else if(!params.password){
            flash.message="请输入密码"
            redirect(controller:"user",action:"login")
        }
        else{
            def user=User.findByUserNameAndPassword(params.userName.toString(),params.password.toString().encodeAsPassword())
        
            if(user){
                session.user=user
                session.userName=user.userName
                flash.message="欢迎 ${user.userName}!"
                redirect(controller:'user',action:'index')
            }
            else{
                flash.message="用户名或者密码错误"
                redirect(controller:"user",action:"login")
            }
        }
    }
    
    def logout = {
        session.invalidate()
        redirect(url:"/")
    }
    
    def loginbox(){
        
    }
    
    def authenticate2={
        if(!params.userName){
            flash.message="请输入用户名"
            redirect(controller:"user",action:"login")
        }
        else if(!params.password){
            flash.message="请输入密码"
            redirect(controller:"user",action:"login")
        }
        else{
            def user=User.findByUserNameAndPassword(params.userName.toString(),params.password.toString().encodeAsPassword())
        
            if(user){
                session.user=user
                session.userName=user.userName
                flash.message="欢迎 ${user.userName}!"
                redirect(controller:'user',action:'frame_account')
            }
            else{
                flash.message="用户名或者密码错误"
                redirect(controller:"user",action:"login")
            }
        }
    }

}
