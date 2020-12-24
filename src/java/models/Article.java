/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.Date;

/**
 *
 * @author 21627
 */
public class Article {
    private int ida;
    private String titre,bio,img;
    private Date datepub;

    public Article(int ida, String titre, String bio, String img, Date datepub) {
        this.ida = ida;
        this.titre = titre;
        this.bio = bio;
        this.img = img;
        this.datepub = datepub;
    }

    public int getIda() {
        return ida;
    }

    public void setId_a(int ida) {
        this.ida = ida;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getDatepub() {
        return datepub;
    }

    public void setDatepub(Date datepub) {
        this.datepub = datepub;
    }
    
    
}
