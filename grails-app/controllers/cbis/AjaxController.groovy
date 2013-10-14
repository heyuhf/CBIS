package cbis

import groovy.json.JsonBuilder
class AjaxController {

    def index() { }
    
    def test(){
        println("ajax be called:"+params.name)
        println("shop id="+params.shopid)
        def newname=""
        def shopInstance=Shop.get(params.shopid)
        if(shopInstance){
            def shoptagnames=params.name.split(",|，")
            def  shopTagInstance
            List jsonlist=new ArrayList()
            shoptagnames.each{
                shopTagInstance=ShopTag.findByTagName(it)
                if(!shopTagInstance){
                    shopTagInstance=new ShopTag(tagName:it)
                    if (!shopTagInstance.save(flush: true)) {
                        response.sendError(405)
                        return
                    }
                    
                }

                if(shopTagInstance.shops){
                    if(shopTagInstance.shops.contains(shopInstance)){
                    println("in  if")
                    }else{
                    shopInstance.addToShopTags(shopTagInstance)
                    def tagjson=new Tagjson(tagName: it,tagid: shopTagInstance.id)
                    jsonlist.add(tagjson)
                    }
                }else{
                    shopInstance.addToShopTags(shopTagInstance)
                    def tagjson=new Tagjson(tagName: it,tagid: shopTagInstance.id)
                    jsonlist.add(tagjson)
                }
            }
            def builder = new JsonBuilder()
            builder = new JsonBuilder(tags: jsonlist)   
            render(builder)
        }
        
        
    }
    
    def addgoodstags(){
        println("goods id="+params.goodsid)
        def newname=""
        def goodsInstance=Goods.get(params.goodsid)
        if(goodsInstance){
            def goodstagnames=params.name.split(",|，")
            def  goodsTagInstance
            List jsonlist=new ArrayList()
            goodstagnames.each{
                goodsTagInstance=GoodsTag.findByTagName(it)
                if(!goodsTagInstance){
                    goodsTagInstance=new GoodsTag(tagName:it)
                    if (!goodsTagInstance.save(flush: true)) {
                        response.sendError(405)
                        return
                    }
                    newname=newname+it+","
                }
                
                if(goodsTagInstance.goods){
                    if(goodsTagInstance.goods.contains(goodsInstance)){
                    println("in  if")
                    }else{
                    goodsInstance.addToGoodsTags(goodsTagInstance)
                    def tagjson=new Tagjson(tagName: it,tagid: goodsTagInstance.id)
                    jsonlist.add(tagjson)
                    }
                }else{
                    goodsInstance.addToGoodsTags(goodsTagInstance)
                    def tagjson=new Tagjson(tagName: it,tagid: goodsTagInstance.id)
                    jsonlist.add(tagjson)
                }
                
            }
            def builder = new JsonBuilder()
            builder = new JsonBuilder(tags: jsonlist)   
            render(builder)
        }
        
    }
    
    
    def delshoptag(){
        
        def shoptag=ShopTag.get(params.tagid)
        def shop=Shop.get(params.shopid)
        if(!shoptag){
            println "no shoptag"
            response.sendError(405)
            return
        }
        shop.removeFromShopTags(shoptag)
        render("ok")
    }
    
    def delgoodstag(){
        def goodstag=GoodsTag.get(params.tagid)
        def goods=Goods.get(params.goodsid)
        if(!goodstag){
            println "no goodstag"
            response.sendError(405)
            return
        }
        goods.removeFromGoodsTags(goodstag)
        render("ok")
    }
    
    def jsontest(){
        
        List list=new ArrayList()
        def tagjson1=new Tagjson(tagName:"tag1",tagid:"1")
        list.add(tagjson1)
        def tagjson2=new Tagjson(tagName:"tag2",tagid:"2")
        list.add(tagjson2)
        def builder = new JsonBuilder()
        
        builder = new JsonBuilder(tags: list)   
        
        
        render(builder)
    }
    
}
