package cbis

class Domain_User {
    String content;
    static constraints = {
        content (blank:false,maxLength:2048) 
    }
}
