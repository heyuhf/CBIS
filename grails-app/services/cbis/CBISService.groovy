package cbis

import service.*
import org.codehaus.xfire.annotations.commons.WebService
import javax.jws.WebService

@WebService(endpointInterface="service.ICBIS")
class CBISService implements ICBIS{

    String test(){
        return "hello cbis!"
    }
    /*
     * 获取所有商家用户对象
     */
    service.User[] getAllUser(){
        ArrayList userlist=new ArrayList()
        service.User user=new service.User("username","address","phonenumber")
        userlist.add(user)
        
        service.User[] result=userlist as service.User[];
        return result;
    }
    /*
     * 通过店铺名字获取单个用户对象
     * 获取某店铺的商家用户对象
     */
    service.User getUserByShopName(String shopName){
        service.User result;
        def shop=Shop.findByShopName(shopName)
        if(shop){
            result=new service.User(shop.user.userName,shop.user.email,shop.user.phoneNumber)
        }
        
        return result;
    }
    
     /*
     * 通过店铺对象获取商家用户对象
     */
    service.User getUserByShop(service.Shop shop){
        service.User result;
        
        //没有 意义
        return result;
    }
    
    /*
     * 获取所有商品对象列表
     */
    service.Goods[] getAllGoods(){
        service.Goods[] result;
        ArrayList goodslist=new ArrayList()
        def goodsList=Goods.list();
        goodsList.each{
            service.Goods goods=new service.Goods(it.goodsName,it.goodsPicUrls,it.price,it.onsale,it.onsalePrice,it.description)
            goodslist.add(goods)
        }
        result=goodslist as service.Goods[]
        return result
    }
    
    /*
     * 通过店铺名获取店铺内的所有商品对象列表
     */
    service.Goods[] getGoodsListByShopName(String shopName){
        service.Goods[] result;
        ArrayList goodslist=new ArrayList()
        def shop=Shop.findByShopName(shopName)
        if(shop){
            if(shop.goods){
                println("ss")
                shop.goods.each{
                    service.Goods goods=new service.Goods(it.goodsName,it.goodsPicUrls,it.price,it.onsale,it.onsalePrice,it.description)
                    goodslist.add(goods)
                }
                result=goodslist as service.Goods[]
            }
            else{
                result=null;
            }
            
        }
        else{
            result=null;
        }
        
        return result
    }
    
    /*
     * 通过店铺对象获取店铺内的所有商品对象列表
     */
    service.Goods[] getGoodsListByShop(service.Shop shop){
        service.Goods[] result;
        
        //意义不大
        return result
    }
    
    /*
     * 通过多个商品标签名获取商品对象列表
     */
    service.Goods[] getGoodsListByTagNames(String[] tagNames){
        service.Goods[] result;
        
        
        println(tagNames)//参数传递没问题
        ArrayList goodslist=new ArrayList()
        def goodslist_first
        if(tagNames){
            def tag=GoodsTag.findByTagName(tagNames[0])
            println(tagNames[0])
            if(tag){
                goodslist_first=tag.goods
                println(goodslist_first)//
            }else{
                
            }
            
        }
        if(goodslist_first){
            goodslist_first.each{goods_it->
                println("first goods ==>"+goods_it)
                Boolean b=false
                tagNames.each{tag_it->
                    println("begin tag ==>"+tag_it)
                    def tag=GoodsTag.findByTagName(tag_it)
                    println("find tag ==>"+tag)
                    println("=========>"+goods_it.goodsTags)
                    println("=========>"+tag)
                    Boolean have=false
                    for(it in goods_it.goodsTags){
                        if(it.tagName==tag.tagName){
                            have=true
                            break;
                        }
                    }
                    if(!have){
                        b=true
                        println("no contains ==>"+tag)
                    }
                }
                if(b==false){
                    
                    //service.User user_temp=new service.User(goods_it.user.userName,goods_it.user.email,goods_it.user.phoneNumber)
                    //service.Shop shop=new service.Shop(goods_it.shop.shopName,goods_it.shop.address,user_temp)
                    
                    service.Goods goods=new service.Goods(goods_it.goodsName,goods_it.goodsPicUrls,goods_it.price,goods_it.onsale,goods_it.onsalePrice,goods_it.description)
                    goodslist.add(goods)
                    
                    
                }
            }
            result=goodslist as service.Goods[]
            println("===R==="+goodslist)
        }
        
        return result
    }
    
    /*
     * 获取所有店铺对象
     */
    service.Shop[] getAllShop(){
        service.Shop[] result;
        ArrayList shoplist=new ArrayList()
        def shopList=Shop.list()
        if(shopList){
            shopList.each{
                service.User user=new service.User(it.user.userName,it.user.email,it.user.phoneNumber)
                service.Shop shop=new service.Shop(it.shopName,it.address,user)
                shoplist.add(shop)
            }
            result=shoplist as service.Shop[]
            
        }
        else{
            result=null
        }
        
        return result;
    }
    
     /*
     * 通过商家用户名获取该商家的所有店铺对象
     */
    service.Shop[] getShopListByUserName(String userName){
        service.Shop[] result;
        ArrayList shoplist=new ArrayList()
        def user=User.findByUserName(userName)
        if(user){
            if(user.shops){
                user.shops.each{
                    service.User user_temp=new service.User(user.userName,user.email,user.phoneNumber)
                    service.Shop shop=new service.Shop(it.shopName,it.address,user_temp)
                    shoplist.add(shop)
                }
                result=shoplist as service.Shop[]
            }else{
                result=null
            }
        }else{
            result=null
        }
        return result;
    }
    
    /*
     * 通过多个标签名搜索合适的店铺列表
     */
    service.Shop[] getShopListByTagNames(String[] tagNames){
        service.Shop[] result;
        println(tagNames)//参数传递没问题
        ArrayList shoplist=new ArrayList()
        def shoplist_first
        if(tagNames){
            def tag=ShopTag.findByTagName(tagNames[0])
            println(tagNames[0])
            shoplist_first=tag.shops
            println(shoplist_first)//
        }
        if(shoplist_first){
            shoplist_first.each{shop_it->
                println("first shop ==>"+shop_it)
                Boolean b=false
                tagNames.each{tag_it->
                    println("begin tag ==>"+tag_it)
                    def tag=ShopTag.findByTagName(tag_it)
                    println("find tag ==>"+tag)
                    println("=========>"+shop_it.shopTags)
                    println("=========>"+tag)
                    Boolean have=false
                    for(it in shop_it.shopTags){
                        if(it.tagName==tag.tagName){
                            have=true
                            break;
                        }
                    }
                    if(!have){
                        b=true
                        println("no contains ==>"+tag)
                    }
                }
                if(b==false){
                    
                    service.User user_temp=new service.User(shop_it.user.userName,shop_it.user.email,shop_it.user.phoneNumber)
                    service.Shop shop=new service.Shop(shop_it.shopName,shop_it.address,user_temp)
                    shoplist.add(shop)
                    
                    //shoplist.add(shop_it)
                }
            }
            result=shoplist as service.Shop[]
            println("===R==="+shoplist)
        }
        
        
        return result;
    }
    
    /*
     * 获取所有广告对象
     */
    service.Ad[] getAllAd(){
        service.Ad[] result;
        
        
        return result;
    }
    
    /*
     * 根据店铺获取广告对象列表
     */
    service.Ad[] getAdListByShop(service.Shop shop){
        service.Ad[] result;
        
        
        return result;
    }
    
    /*
     * 根据时间获取广告对象列表
     */
    service.Ad[] getAdListByDate(Date date){
        service.Ad[] result;
        
        
        return result;
    }
    
}
