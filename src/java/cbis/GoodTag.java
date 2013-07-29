/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

/**
 *
 * @author heyu
 */
public class GoodTag {
    String tagName;
    Good good;
    GoodTag(String tagName,Good good){
        this.tagName=tagName;
        this.good=good;
        
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }
    
}
