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
    String goodsName;
    String goodsPicUrls;
    BigDecimal price;
    String onsale;
    BigDecimal onsalePrice;
    String description;
    
    Goods(String goodsName,String goodsPicUrls,BigDecimal price,String onsale,BigDecimal onsalePrice,String description){
        this.goodsName=goodsName;
        this.goodsPicUrls=goodsPicUrls;
        this.price=price;
        this.onsale=onsale;
        this.onsalePrice=onsalePrice;
        this.description=description;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsPicUrls() {
        return goodsPicUrls;
    }

    public void setGoodsPicUrls(String goodsPicUrls) {
        this.goodsPicUrls = goodsPicUrls;
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
