/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


/**
 *
 * @author heyu
 */
public class ShopTag {
    private String tagName;
    private Shop shop;
    
    ShopTag(String tagName,Shop shop){
        this.tagName=tagName;
        this.shop=shop;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
    
    
}
