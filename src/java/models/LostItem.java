package models;

import java.io.Serializable;
import java.util.Date;

public class LostItem implements Serializable {
    private String id;
    private String itemName;
    private String category;
    private String locationFound;
    private String lockerStation;
    private String status;
    private String surrenderedBy;
    private String contactInfo;
    private String description;
    private Date dateLogged;

    public LostItem() {
    }

    public LostItem(String id, String itemName, String category, String locationFound, String lockerStation, String status, String surrenderedBy, String contactInfo, String description, Date dateLogged) {
        this.id = id;
        this.itemName = itemName;
        this.category = category;
        this.locationFound = locationFound;
        this.lockerStation = lockerStation;
        this.status = status;
        this.surrenderedBy = surrenderedBy;
        this.contactInfo = contactInfo;
        this.description = description;
        this.dateLogged = dateLogged;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLocationFound() {
        return locationFound;
    }

    public void setLocationFound(String locationFound) {
        this.locationFound = locationFound;
    }

    public String getLockerStation() {
        return lockerStation;
    }

    public void setLockerStation(String lockerStation) {
        this.lockerStation = lockerStation;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSurrenderedBy() {
        return surrenderedBy;
    }

    public void setSurrenderedBy(String surrenderedBy) {
        this.surrenderedBy = surrenderedBy;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateLogged() {
        return dateLogged;
    }

    public void setDateLogged(Date dateLogged) {
        this.dateLogged = dateLogged;
    }
}
