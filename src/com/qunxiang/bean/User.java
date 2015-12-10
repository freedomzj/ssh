package com.qunxiang.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="user"
    ,catalog="qunxiang"
)

public class User  implements java.io.Serializable {


    // Fields    

     private Integer userId;
     private String username;
     private String password;
     private String userPhone;
     private String userMobile;
     private String userEmail;
     private String userQq;
     private String userAddress;
     private String userConecter;
     private String userCompanyName;
     private String userCompanyDes;
     private Integer userFocusCount;
     private Integer userStatus;
     private Integer userTypeId;
     private String userDetailDes;
     private String userSelfDes;
     private String userImg1;
     private String userImg2;


    // Constructors

    /** default constructor */
    public User() {
    }

    
    /** full constructor */
    public User(String username, String password, String userPhone, String userMobile, String userEmail, String userQq, String userAddress, String userConecter, String userCompanyName, String userCompanyDes, Integer userFocusCount, Integer userStatus, Integer userTypeId, String userDetailDes, String userSelfDes, String userImg1, String userImg2) {
        this.username = username;
        this.password = password;
        this.userPhone = userPhone;
        this.userMobile = userMobile;
        this.userEmail = userEmail;
        this.userQq = userQq;
        this.userAddress = userAddress;
        this.userConecter = userConecter;
        this.userCompanyName = userCompanyName;
        this.userCompanyDes = userCompanyDes;
        this.userFocusCount = userFocusCount;
        this.userStatus = userStatus;
        this.userTypeId = userTypeId;
        this.userDetailDes = userDetailDes;
        this.userSelfDes = userSelfDes;
        this.userImg1 = userImg1;
        this.userImg2 = userImg2;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="user_id", unique=true, nullable=false)

    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
    @Column(name="username")

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    @Column(name="password")

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column(name="user_phone")

    public String getUserPhone() {
        return this.userPhone;
    }
    
    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }
    
    @Column(name="user_mobile")

    public String getUserMobile() {
        return this.userMobile;
    }
    
    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }
    
    @Column(name="user_email")

    public String getUserEmail() {
        return this.userEmail;
    }
    
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    @Column(name="user_qq")

    public String getUserQq() {
        return this.userQq;
    }
    
    public void setUserQq(String userQq) {
        this.userQq = userQq;
    }
    
    @Column(name="user_address")

    public String getUserAddress() {
        return this.userAddress;
    }
    
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
    
    @Column(name="user_conecter")

    public String getUserConecter() {
        return this.userConecter;
    }
    
    public void setUserConecter(String userConecter) {
        this.userConecter = userConecter;
    }
    
    @Column(name="user_company_name")

    public String getUserCompanyName() {
        return this.userCompanyName;
    }
    
    public void setUserCompanyName(String userCompanyName) {
        this.userCompanyName = userCompanyName;
    }
    
    @Column(name="user_company_des", length=65535)

    public String getUserCompanyDes() {
        return this.userCompanyDes;
    }
    
    public void setUserCompanyDes(String userCompanyDes) {
        this.userCompanyDes = userCompanyDes;
    }
    
    @Column(name="user_focus_count")

    public Integer getUserFocusCount() {
        return this.userFocusCount;
    }
    
    public void setUserFocusCount(Integer userFocusCount) {
        this.userFocusCount = userFocusCount;
    }
    
    @Column(name="user_status")

    public Integer getUserStatus() {
        return this.userStatus;
    }
    
    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }
    
    @Column(name="user_type_id")

    public Integer getUserTypeId() {
        return this.userTypeId;
    }
    
    public void setUserTypeId(Integer userTypeId) {
        this.userTypeId = userTypeId;
    }
    
    @Column(name="user_detail_des", length=65535)

    public String getUserDetailDes() {
        return this.userDetailDes;
    }
    
    public void setUserDetailDes(String userDetailDes) {
        this.userDetailDes = userDetailDes;
    }
    
    @Column(name="user_self_des", length=65535)

    public String getUserSelfDes() {
        return this.userSelfDes;
    }
    
    public void setUserSelfDes(String userSelfDes) {
        this.userSelfDes = userSelfDes;
    }
    
    @Column(name="user_img1")

    public String getUserImg1() {
        return this.userImg1;
    }
    
    public void setUserImg1(String userImg1) {
        this.userImg1 = userImg1;
    }
    
    @Column(name="user_img2")

    public String getUserImg2() {
        return this.userImg2;
    }
    
    public void setUserImg2(String userImg2) {
        this.userImg2 = userImg2;
    }
   








}