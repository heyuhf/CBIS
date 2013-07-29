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
        
        
        return result;
    }
    
     /*
     * 通过店铺对象获取商家用户对象
     */
    service.User getUserByShop(service.Shop shop){
        service.User result;
        
        
        return result;
    }
    
    /*
     * 获取所有商品对象列表
     */
    service.Goods[] getAllGoods(){
        service.Goods[] result;
        
        
        return result;
    }
    
    /*
     * 通过店铺名获取店铺内的所有商品对象列表
     */
    service.Goods[] getGoodsListByShopName(String shopName){
        service.Goods[] result;
        
        
        return result;
    }
    
    /*
     * 通过店铺对象获取店铺内的所有商品对象列表
     */
    service.Goods[] getGoodsListByShop(service.Shop shop){
        service.Goods[] result;
        
        
        return result;
    }
    
    /*
     * 通过多个商品标签名获取商品对象列表
     */
    service.Goods[] getGoodsListByTagNames(String[] tagNames){
        service.Goods[] result;
        
        
        return result;
    }
    
    /*
     * 获取所有店铺对象
     */
    service.Shop[] getAllShop(){
        service.Shop[] result;
        
        
        return result;
    }
    
     /*
     * 通过商家用户名获取该商家的所有店铺对象
     */
    service.Shop[] getShopListByUserName(String userName){
        service.Shop[] result;
        
        
        return result;
    }
    
    /*
     * 通过多个标签名搜索合适的店铺列表
     */
    service.Shop[] getShopListByTagNames(String[] tagNames){
        service.Shop[] result;
        
        
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
