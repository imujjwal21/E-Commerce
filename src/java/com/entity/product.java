
package com.entity;


public class product {
    
     private String id;
    private String name;
    private String category;
    private String price;
    private String active;
    private String photo;

    public product(String name, String category, String price, String active, String photo) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.active = active;
        this.photo = photo;
    }

    public product(String id, String name, String category, String price, String active, String photo) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.active = active;
        this.photo = photo;
    }

    // use for edit product
//     public product(String id, String name, String category, String price, String active) {
//        this.id = id;
//        this.name = name;
//        this.category = category;
//        this.price = price;
//        this.active = active;
//    }
     
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPic(String photo) {
        this.photo = photo;
    }
    
    
    
}
