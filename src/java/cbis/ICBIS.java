/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

import java.util.Date;
import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 *
 * @author heyu
 */
@WebService(serviceName="CBISService")
public interface ICBIS {
    /*
     * test方法
     */
    @WebMethod()
    String test();
    
    /*
     * 获取所有商家用户对象
     */
    @WebMethod()
    User[] getAllUser();
    /*
     * 通过店铺名字获取单个用户对象
     * 获取某店铺的商家用户对象
     */
    @WebMethod()
    User getUserByShopName(String shopName);
    
    /*
     * 通过店铺对象获取商家用户对象
     */
    @WebMethod()
    User getUserByShop(Shop shop);
    /*
     * 获取所有商品对象列表
     */
    @WebMethod()
    Good[] getAllGood();
    
    /*
     * 通过店铺名获取店铺内的所有商品对象列表
     */
    @WebMethod()
    Good[] getGoodListByShopName(String shopName);
    
    /*
     * 通过店铺对象获取店铺内的所有商品对象列表
     */
    @WebMethod()
    Good[] getGoodListByShop(Shop shop);
    
    /*
     * 通过多个商品标签名获取商品对象列表
     */
    @WebMethod()
    Good[] getGoodListByTagNames(String[] tagNames);
    
    
    /*
     * 获取所有店铺对象
     */
    @WebMethod()
    Shop[] getAllShop();
    
    /*
     * 通过商家用户名获取该商家的所有店铺对象
     */
    @WebMethod()
    Shop[] getShopListByUserName(String userName);
    
    /*
     * 通过多个标签名搜索合适的店铺列表
     */
    @WebMethod()
    Shop[] getShopListByTagNames(String[] tagNames);
    
    /*
     * 获取所有广告对象
     */
    @WebMethod()
    Ad[] getAllAd();
    
    /*
     * 根据店铺获取广告对象列表
     */
    @WebMethod()
    Ad[] getAdListByShop(Shop shop);
    
    /*
     * 根据时间获取广告对象列表
     */
    @WebMethod()
    Ad[] getAdListByDate(Date date);
}
