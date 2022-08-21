
package com.entity;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String phno;
    private String address;
    private String city;
    private String state;
    private String pincode;
    private String gender;
    private String profile;

    public User() {
    }

    public User(int id, String name, String email, String password, String phno, String address, String city, String state, String pincode, String gender, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phno = phno;
        this.address = address;
        this.city = city;
        this.state = state;
        this.pincode = pincode;
        this.gender = gender;
        this.profile = profile;
    }

    public User(String name, String email, String password, String phno, String address, String city, String state, String pincode, String gender, String profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phno = phno;
        this.address = address;
        this.city = city;
        this.state = state;
        this.pincode = pincode;
        this.gender = gender;
        this.profile = profile;
    }

    public User(String name, String email, String password, String phno, String gender) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phno = phno;
        this.gender = gender;
    }
    
   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

   
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
    
    
    
}

