package cbis

class GoodsTag {

    String tagName
    static belongsTo=Goods
    static hasMany=[goods:Goods]
    static constraints = {
    }
}
