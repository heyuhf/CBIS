/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.math.BigDecimal;

/**
 *
 * @author heyu
 */
public class Goods {
    String goodName;
    String goodPicUrls;
    BigDecimal price;
    String onsale;
    BigDecimal onsalePrice;
    String description;
    
    Goods(String goodName,String goodPicUrls,BigDecimal price,String onsale,BigDecimal onsalePrice,String description){
        this.goodName=goodName;
        this.goodPicUrls=goodPicUrls;
        this.price=price;
        this.onsale=onsale;
        this.onsalePrice=onsalePrice;
        this.description=description;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getGoodPicUrls() {
        return goodPicUrls;
    }

    public void setGoodPicUrls(String goodPicUrls) {
        this.goodPicUrls = goodPicUrls;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getOnsale() {
        return onsale;
    }

    public void setOnsale(String onsale) {
        this.onsale = onsale;
    }

    public BigDecimal getOnsalePrice() {
        return onsalePrice;
    }

    public void setOnsalePrice(BigDecimal onsalePrice) {
        this.onsalePrice = onsalePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
