/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

import java.util.Date;

/**
 *
 * @author heyu
 */
public class Ad {
    String content;
    Shop shop;
    Date date;
    Ad(String content,Shop shop,Date date){
        this.content=content;
        this.shop=shop;
        this.date=date;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
    
}
