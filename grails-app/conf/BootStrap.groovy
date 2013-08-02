import cbis.User
class BootStrap {

    def init = { servletContext ->
        
        def user=new User(userName:'user',password:'123456',email:'user@cbis.com',phoneNumber:'1234567')
        
        if(user.save()){
            println 'new user saved'
        }
        
    }
    def destroy = {
    }
}
