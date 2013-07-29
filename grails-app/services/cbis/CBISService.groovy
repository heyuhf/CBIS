package cbis

import org.codehaus.xfire.annotations.commons.WebService
import javax.jws.WebService

@WebService(endpointInterface="cbis.ICBIS")
class CBISService implements ICBIS{

    String test(){
        return "hello cbis!"
    }
    /*
     * 获取所有商家用户对象
     */
    User[] getAllUser(){
        ArrayList userlist=new ArrayList()
        
        
        User[] result=userlist as User[];
        return result;
    }
    /*
     * 通过店铺名字获取单个用户对象
     * 获取某店铺的商家用户对象
     */
    User getUserByShopName(String shopName){
        User result;
        
        
        return result;
    }
    
     /*
     * 通过店铺对象获取商家用户对象
     */
    User getUserByShop(Shop shop){
         User result;
        
        
        return result;
    }
    
    /*
     * 获取所有商品对象列表
     */
    Good[] getAllGood(){
        Good[] result;
        
        
        return result;
    }
    
    /*
     * 通过店铺名获取店铺内的所有商品对象列表
     */
    Good[] getGoodListByShopName(String shopName){
        Good[] result;
        
        
        return result;
    }
    
    /*
     * 通过店铺对象获取店铺内的所有商品对象列表
     */
    Good[] getGoodListByShop(Shop shop){
        Good[] result;
        
        
        return result;
    }
    
    /*
     * 通过多个商品标签名获取商品对象列表
     */
    Good[] getGoodListByTagNames(String[] tagNames){
        Good[] result;
        
        
        return result;
    }
    
    /*
     * 获取所有店铺对象
     */
    Shop[] getAllShop(){
        Shop[] result;
        
        
        return result;
    }
    
     /*
     * 通过商家用户名获取该商家的所有店铺对象
     */
    Shop[] getShopListByUserName(String userName){
        Shop[] result;
        
        
        return result;
    }
    
    /*
     * 通过多个标签名搜索合适的店铺列表
     */
    Shop[] getShopListByTagNames(String[] tagNames){
        Shop[] result;
        
        
        return result;
    }
    
    /*
     * 获取所有广告对象
     */
    Ad[] getAllAd(){
        Ad[] result;
        
        
        return result;
    }
    
    /*
     * 根据店铺获取广告对象列表
     */
    Ad[] getAdListByShop(Shop shop){
        Ad[] result;
        
        
        return result;
    }
    
    /*
     * 根据时间获取广告对象列表
     */
    Ad[] getAdListByDate(Date date){
        Ad[] result;
        
        
        return result;
    }
    
}
