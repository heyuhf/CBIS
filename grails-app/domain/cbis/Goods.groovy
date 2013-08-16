package cbis

enum Unit{个,件,斤,千克}
class Goods {
    String goodsName
    String description
    BigDecimal price
    BigDecimal onsalePrice
    String onsale
    String goodsPicUrls
    User user
    Shop shop
    Unit unit
    static hasMany=[goodsTags:GoodsTag]
    static constraints = {
        goodsName(size:2..20,blank:false)
        price(blank:false)
        description(maxsize:10000)
        onsalePrice(blank:true)
        onsale(blank:false)
    }
}
