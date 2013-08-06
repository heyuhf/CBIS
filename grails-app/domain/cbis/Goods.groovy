package cbis

class Goods {
    String goodsName
    String description
    BigDecimal price
    BigDecimal onsalePrice
    String onsale
    String goodsPicUrls
    User user
    Shop shop
    static hasMany=[goodsTags:GoodsTag]
    static constraints = {
        goodsName(size:2..15,blank:false)
        price(blank:false)
        description(maxsize:10000)
        onsalePrice(blank:true)
        onsale(blank:false)
    }
}
