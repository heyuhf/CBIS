package cbis

class Shop {
    String shopName
    String address
    User user
    String description
    String[] shopLogoUrls
    static belongsTo=User
    static hasMany=[goods:Goods]
    static constraints = {
        shopName(size:2..20,blank:false)
        address(maxSize:200,blank:false)
    }
    String toString(){
        shopName
    }
}
