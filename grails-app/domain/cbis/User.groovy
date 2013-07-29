package cbis

class User {
    String userName
    String password
    String email
    String phoneNumber
    
    static hasMany=[shops:Shop]
    static constraints = {
        userName(size:2..10,blank:false)
        password(size:6..30,blank:false)
        email(email:true,unique:true,blank:false)
        phoneNumber(matches:/\d{7,11}/,blank:false)  
    }
    
    String toString(){
        userName
    }
}
