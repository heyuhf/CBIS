package cbis

class Ad {
    String title
    Date date
    Date deadline
    Boolean hasEnd
    String content
    User user
    static belongsTo=[shop:Shop]
    static constraints = {
    }
}
