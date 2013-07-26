/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

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
     * 通过店铺名字获取单个用户对象
     */
    @WebMethod()
    User getUserByShopName();
    
    /*
     * 通过单个或者多个标签获取用户对象列表
     */
    @WebMethod()
    User[] getUserListByTags();
    
    
    
}
