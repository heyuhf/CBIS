package cbis

class ShopTag {
    String tagName
    static belongsTo=Shop
    static hasMany=[shops:Shop]
    static constraints = {
    }
    
}
