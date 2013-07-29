/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

/**
 *
 * @author heyu
 */
public class Shop {
    private User user;
    private String shopName;
    private String address;

    Shop(String shopName,String address,User user){
        this.shopName=shopName;
        this.address=address;
        this.user=user;
    }
    
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
