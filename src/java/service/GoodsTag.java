/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


/**
 *
 * @author heyu
 */
public class GoodsTag {
    String tagName;
    Goods good;
    GoodsTag(String tagName,Goods good){
        this.tagName=tagName;
        this.good=good;
        
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public Goods getGood() {
        return good;
    }

    public void setGood(Goods good) {
        this.good = good;
    }
    
}
