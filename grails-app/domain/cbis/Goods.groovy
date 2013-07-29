package cbis

class Goods {
    String goodName
    String description
    BigDecimal price
    BigDecimal onsalePrice
    String onsale
    String[] goodPicUrls
    Shop shop
    static belongsTo=Shop
    static constraints = {
        goodName(size:2..10,blank:false)
        price(blank:false)
        description(maxsize:10000)
        onsalePrice(blank:true)
        onsale(blank:false)
    }
}
