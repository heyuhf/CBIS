/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

/**
 *
 * @author heyu
 */
public class User {
    private String userName;
    private String address;
    private String phoneNumber;

    public User(String userName,String address,String phoneNumber){
        this.userName=userName;
        this.address=address;
        this.phoneNumber=phoneNumber;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    
    
}
