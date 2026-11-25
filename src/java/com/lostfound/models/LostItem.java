/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lostfound.models;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author JIllianne
 */
public class LostItem implements Serializable {

    private static final long serialVaersionUID = 1L;

    private int id;
    private String title;
    private String category;
    private String description;
    private String locationFound;
    private String locker;
    private String status;
    private Date dateReported;
    private Date dateClaimed;
    private String reportedBy;

    public LostItem() {
        this.dateReported = new Date();
        this.status = "REPORTED";
    }

    public LostItem(int id, String title, String category, String description, String locationFound, String locker, String status, Date dateReported, String reportedBy) {
        this.id = id;
        this.title = title;
        this.category = category;
        this.description = description;
        this.locationFound = locationFound;
        this.locker = locker;
        this.status = status;
        this.dateReported = dateReported;
        this.reportedBy = reportedBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocationFound() {
        return locationFound;
    }

    public void setLocationFound(String locationFound) {
        this.locationFound = locationFound;
    }

    public String getLocker() {
        return locker;
    }

    public void setLocker(String locker) {
        this.locker = locker;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateReported() {
        return dateReported;
    }

    public void setDateReported(Date dateReported) {
        this.dateReported = dateReported;
    }

    public Date detDateClaimed() {
        return dateClaimed;
    }

    public void setDateClaimed(Date dateClaimed) {
        this.dateClaimed = dateClaimed;
    }

    public String getReportedBy() {
        return reportedBy;
    }

    public void setReportedBy(String reportedBy) {
        this.reportedBy = reportedBy;
    }
}