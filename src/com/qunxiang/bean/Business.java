package com.qunxiang.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


/**
 * Business entity. @author MyEclipse Persistence Tools
 */
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
@Entity
@Table(name="business"
    ,catalog="qunxiang"
)

public class Business  implements java.io.Serializable {


    // Fields    

     private Integer businessId;
     private Integer businessUserId;
     private Integer businessStatus;
     private Integer businessType;
     private Integer businessIndustryId;
     private Integer businessDepartmentId;
     private Integer businessFocusCount;
     private String businessName;
     private String businessConnecter;
     private String businessMobile;
     private String businessQq;
     private String businessEmail;
     private String businessRequire;
     private String businessChallengeExperience;
     private String businessHobby;
     private String businessProductMarket;
     private String businessCooperation;
     private String businessDescription;
     private String businessOther;
     private String businessImg1;
     private String businessImg2;


    // Constructors

    /** default constructor */
    public Business() {
    }

    
    /** full constructor */
    public Business(Integer businessUserId, Integer businessStatus, Integer businessType, Integer businessIndustryId, Integer businessDepartmentId, Integer businessFocusCount, String businessName, String businessConnecter, String businessMobile, String businessQq, String businessEmail, String businessRequire, String businessChallengeExperience, String businessHobby, String businessProductMarket, String businessCooperation, String businessDescription, String businessOther, String businessImg1, String businessImg2) {
        this.businessUserId = businessUserId;
        this.businessStatus = businessStatus;
        this.businessType = businessType;
        this.businessIndustryId = businessIndustryId;
        this.businessDepartmentId = businessDepartmentId;
        this.businessFocusCount = businessFocusCount;
        this.businessName = businessName;
        this.businessConnecter = businessConnecter;
        this.businessMobile = businessMobile;
        this.businessQq = businessQq;
        this.businessEmail = businessEmail;
        this.businessRequire = businessRequire;
        this.businessChallengeExperience = businessChallengeExperience;
        this.businessHobby = businessHobby;
        this.businessProductMarket = businessProductMarket;
        this.businessCooperation = businessCooperation;
        this.businessDescription = businessDescription;
        this.businessOther = businessOther;
        this.businessImg1 = businessImg1;
        this.businessImg2 = businessImg2;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="business_id", unique=true, nullable=false)

    public Integer getBusinessId() {
        return this.businessId;
    }
    
    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }
    
    @Column(name="business_user_id")

    public Integer getBusinessUserId() {
        return this.businessUserId;
    }
    
    public void setBusinessUserId(Integer businessUserId) {
        this.businessUserId = businessUserId;
    }
    
    @Column(name="business_status")

    public Integer getBusinessStatus() {
        return this.businessStatus;
    }
    
    public void setBusinessStatus(Integer businessStatus) {
        this.businessStatus = businessStatus;
    }
    
    @Column(name="business_type")

    public Integer getBusinessType() {
        return this.businessType;
    }
    
    public void setBusinessType(Integer businessType) {
        this.businessType = businessType;
    }
    
    @Column(name="business_industry_id")

    public Integer getBusinessIndustryId() {
        return this.businessIndustryId;
    }
    
    public void setBusinessIndustryId(Integer businessIndustryId) {
        this.businessIndustryId = businessIndustryId;
    }
    
    @Column(name="business_department_id")

    public Integer getBusinessDepartmentId() {
        return this.businessDepartmentId;
    }
    
    public void setBusinessDepartmentId(Integer businessDepartmentId) {
        this.businessDepartmentId = businessDepartmentId;
    }
    
    @Column(name="business_focus_count")

    public Integer getBusinessFocusCount() {
        return this.businessFocusCount;
    }
    
    public void setBusinessFocusCount(Integer businessFocusCount) {
        this.businessFocusCount = businessFocusCount;
    }
    
    @Column(name="business_name")

    public String getBusinessName() {
        return this.businessName;
    }
    
    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }
    
    @Column(name="business_connecter")

    public String getBusinessConnecter() {
        return this.businessConnecter;
    }
    
    public void setBusinessConnecter(String businessConnecter) {
        this.businessConnecter = businessConnecter;
    }
    
    @Column(name="business_mobile")

    public String getBusinessMobile() {
        return this.businessMobile;
    }
    
    public void setBusinessMobile(String businessMobile) {
        this.businessMobile = businessMobile;
    }
    
    @Column(name="business_qq")

    public String getBusinessQq() {
        return this.businessQq;
    }
    
    public void setBusinessQq(String businessQq) {
        this.businessQq = businessQq;
    }
    
    @Column(name="business_email")

    public String getBusinessEmail() {
        return this.businessEmail;
    }
    
    public void setBusinessEmail(String businessEmail) {
        this.businessEmail = businessEmail;
    }
    
    @Column(name="business_require", length=65535)

    public String getBusinessRequire() {
        return this.businessRequire;
    }
    
    public void setBusinessRequire(String businessRequire) {
        this.businessRequire = businessRequire;
    }
    
    @Column(name="business_challenge_experience", length=65535)

    public String getBusinessChallengeExperience() {
        return this.businessChallengeExperience;
    }
    
    public void setBusinessChallengeExperience(String businessChallengeExperience) {
        this.businessChallengeExperience = businessChallengeExperience;
    }
    
    @Column(name="business_hobby", length=65535)

    public String getBusinessHobby() {
        return this.businessHobby;
    }
    
    public void setBusinessHobby(String businessHobby) {
        this.businessHobby = businessHobby;
    }
    
    @Column(name="business_product_market", length=65535)

    public String getBusinessProductMarket() {
        return this.businessProductMarket;
    }
    
    public void setBusinessProductMarket(String businessProductMarket) {
        this.businessProductMarket = businessProductMarket;
    }
    
    @Column(name="business_cooperation", length=65535)

    public String getBusinessCooperation() {
        return this.businessCooperation;
    }
    
    public void setBusinessCooperation(String businessCooperation) {
        this.businessCooperation = businessCooperation;
    }
    
    @Column(name="business_description", length=65535)

    public String getBusinessDescription() {
        return this.businessDescription;
    }
    
    public void setBusinessDescription(String businessDescription) {
        this.businessDescription = businessDescription;
    }
    
    @Column(name="business_other", length=65535)

    public String getBusinessOther() {
        return this.businessOther;
    }
    
    public void setBusinessOther(String businessOther) {
        this.businessOther = businessOther;
    }
    
    @Column(name="business_img1")

    public String getBusinessImg1() {
        return this.businessImg1;
    }
    
    public void setBusinessImg1(String businessImg1) {
        this.businessImg1 = businessImg1;
    }
    
    @Column(name="business_img2")

    public String getBusinessImg2() {
        return this.businessImg2;
    }
    
    public void setBusinessImg2(String businessImg2) {
        this.businessImg2 = businessImg2;
    }
   








}