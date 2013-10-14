/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


/**
 *
 * @author heyu
 */
public class User {
    private String userName;
    private String emailaddress;
    private String phoneNumber;

    public User(String userName,String emailaddress,String phoneNumber){
        this.userName=userName;
        this.emailaddress=emailaddress;
        this.phoneNumber=phoneNumber;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddress() {
        return emailaddress;
    }

    public void setAddress(String address) {
        this.emailaddress = emailaddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    
    
}
