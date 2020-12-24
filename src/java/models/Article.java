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
    private int id_a;
    private String titre,bio,img;
    private Date datepub;

    public Article(int id_a, String titre, String bio, String img, Date datepub) {
        this.id_a = id_a;
        this.titre = titre;
        this.bio = bio;
        this.img = img;
        this.datepub = datepub;
    }

    public int getId_a() {
        return id_a;
    }

    public void setId_a(int id_a) {
        this.id_a = id_a;
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
