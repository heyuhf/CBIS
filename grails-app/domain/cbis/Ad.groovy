package cbis

class Ad {
    String title
    Date date
    String content
    static belongsTo=Shop
    static constraints = {
    }
}
