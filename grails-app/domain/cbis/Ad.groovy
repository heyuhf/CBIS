package cbis

class Ad {
    String title
    Date date
    String content
    static belongsTo=[shop:Shop]
    static constraints = {
    }
}
