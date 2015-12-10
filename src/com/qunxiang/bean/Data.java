package com.qunxiang.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Data entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="data"
    ,catalog="qunxiang"
)

public class Data  implements java.io.Serializable {


    // Fields    

     private Integer dataId;
     private String dataContent;
     private String dataDescription;


    // Constructors

    /** default constructor */
    public Data() {
    }

    
    /** full constructor */
    public Data(String dataContent, String dataDescription) {
        this.dataContent = dataContent;
        this.dataDescription = dataDescription;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="data_id", unique=true, nullable=false)

    public Integer getDataId() {
        return this.dataId;
    }
    
    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }
    
    @Column(name="data_content", length=65535)

    public String getDataContent() {
        return this.dataContent;
    }
    
    public void setDataContent(String dataContent) {
        this.dataContent = dataContent;
    }
    
    @Column(name="data_description", length=65535)

    public String getDataDescription() {
        return this.dataDescription;
    }
    
    public void setDataDescription(String dataDescription) {
        this.dataDescription = dataDescription;
    }
   








}