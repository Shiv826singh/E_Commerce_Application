package com.example.E_Commerce_Application.entity;

import jakarta.persistence.*;
import com.example.E_Commerce_Application.entity.Category;


@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long pId;
    private String pName;
    @Column(length = 300)
    private String pDesc;
    private String pPhoto;
    private int pPrice;
    private int pDiscount;
    private int pQuantity;
    @ManyToOne
    private Category categ;

    public Product() {
    }

    public Product(long pId, String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category categ) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.categ = categ;
    }
    public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category categ) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.categ = categ;
    }

    public long getpId() {
        return pId;
    }

    public void setpId(long pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCateg() {
        return categ;
    }

    public void setCateg(Category categ) {
        this.categ = categ;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pDesc='" + pDesc + '\'' +
                ", pPhoto='" + pPhoto + '\'' +
                ", pPrice=" + pPrice +
                ", pDiscount=" + pDiscount +
                ", pQuantity=" + pQuantity +
                '}';
    }
    //calculate price after discount
    public  int getPriceAfterApplyingDiscount() {
        int dis=(int)((this.getpDiscount()/100.0)*this.getpPrice());
        return this.getpPrice()-dis;
    }
}
