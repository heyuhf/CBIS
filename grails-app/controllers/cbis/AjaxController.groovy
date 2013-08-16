package cbis

class AjaxController {

    def index() { }
    
    def test(){
        /*
        def shoptagnames=params.name.split(",|，")
        shoptagnames.each{
            def  shopTagInstance=ShopTag.findByTagName(it)
            if(!shopTagInstance){
                shopTagInstance=new ShopTag(tagName:it)
                if (!shopTagInstance.save(flush: true)) {
                        response.sendError(405)
                        return
                }
            }
            shopInstance.addToShopTags(shopTagInstance)
        }
        */
       
        
        println("ajax be called:"+params.name)
        println("shop id="+params.shopid)
        def newname=""
        def shopInstance=Shop.get(params.shopid)
        if(shopInstance){
            def shoptagnames=params.name.split(",|，")
            shoptagnames.each{
                def  shopTagInstance=ShopTag.findByTagName(it)
                if(!shopTagInstance){
                    shopTagInstance=new ShopTag(tagName:it)
                    if (!shopTagInstance.save(flush: true)) {
                        response.sendError(405)
                        return
                    }
                    newname=newname+it+","
                }
                shopInstance.addToShopTags(shopTagInstance)
            }
        }
        render(newname)
    }
}
