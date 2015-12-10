package com.qunxiang.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Industry entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="industry"
    ,catalog="qunxiang"
)

public class Industry  implements java.io.Serializable {


    // Fields    

     private Integer industryId;
     private String industryName;


    // Constructors

    /** default constructor */
    public Industry() {
    }

    
    /** full constructor */
    public Industry(String industryName) {
        this.industryName = industryName;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="industry_id", unique=true, nullable=false)

    public Integer getIndustryId() {
        return this.industryId;
    }
    
    public void setIndustryId(Integer industryId) {
        this.industryId = industryId;
    }
    
    @Column(name="industry_name")

    public String getIndustryName() {
        return this.industryName;
    }
    
    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }
   








}