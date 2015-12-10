package com.qunxiang.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Train entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="train"
    ,catalog="qunxiang"
)

public class Train  implements java.io.Serializable {


    // Fields    

     private Integer trainId;
     private String trainName;
     private Double trainPrice;
     private Integer trainPoqiedu;
     private Integer trainIndustryId;
     private Integer trainUserId;
     private String trainConnecter;
     private String trainPhone;
     private String trainMobile;
     private String trainEmail;
     private String trainQq;
     private Integer trainFocusCount;
     private Integer trainStatus;
     private Integer trainType;
     private String trainTeacher;
     private String trainCompanyName;
     private String trainCompanyEmail;
     private String trainRequire;
     private String trainQuestionChallenge;
     private String trainContentOutline;
     private String trainCompanyDes;
     private String trainOther;
     private String trainImg1;
     private String trainImg2;
     private String trainImg3;


    // Constructors

    /** default constructor */
    public Train() {
    }

    
    /** full constructor */
    public Train(String trainName, Double trainPrice, Integer trainPoqiedu, Integer trainIndustryId, String trainConnecter, String trainPhone, String trainMobile, String trainEmail, String trainQq, Integer trainFocusCount, Integer trainStatus, Integer trainType, String trainTeacher, String trainCompanyName, String trainCompanyEmail, String trainRequire, String trainQuestionChallenge, String trainContentOutline, String trainCompanyDes, String trainOther, String trainImg1, String trainImg2, String trainImg3) {
        this.trainName = trainName;
        this.trainPrice = trainPrice;
        this.trainPoqiedu = trainPoqiedu;
        this.trainIndustryId = trainIndustryId;
        this.trainConnecter = trainConnecter;
        this.trainPhone = trainPhone;
        this.trainMobile = trainMobile;
        this.trainEmail = trainEmail;
        this.trainQq = trainQq;
        this.trainFocusCount = trainFocusCount;
        this.trainStatus = trainStatus;
        this.trainType = trainType;
        this.trainTeacher = trainTeacher;
        this.trainCompanyName = trainCompanyName;
        this.trainCompanyEmail = trainCompanyEmail;
        this.trainRequire = trainRequire;
        this.trainQuestionChallenge = trainQuestionChallenge;
        this.trainContentOutline = trainContentOutline;
        this.trainCompanyDes = trainCompanyDes;
        this.trainOther = trainOther;
        this.trainImg1 = trainImg1;
        this.trainImg2 = trainImg2;
        this.trainImg3 = trainImg3;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="train_id", unique=true, nullable=false)

    public Integer getTrainId() {
        return this.trainId;
    }
    
    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }
    
    @Column(name="train_name")

    public String getTrainName() {
        return this.trainName;
    }
    
    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }
    
    @Column(name="train_price", precision=22, scale=0)

    public Double getTrainPrice() {
        return this.trainPrice;
    }
    
    public void setTrainPrice(Double trainPrice) {
        this.trainPrice = trainPrice;
    }
    
    @Column(name="train_poqiedu")

    public Integer getTrainPoqiedu() {
        return this.trainPoqiedu;
    }
    
    public void setTrainPoqiedu(Integer trainPoqiedu) {
        this.trainPoqiedu = trainPoqiedu;
    }
    
    @Column(name="train_industry_id")

    public Integer getTrainIndustryId() {
        return this.trainIndustryId;
    }
    
    public void setTrainIndustryId(Integer trainIndustryId) {
        this.trainIndustryId = trainIndustryId;
    }
    
    @Column(name="train_connecter")

    public String getTrainConnecter() {
        return this.trainConnecter;
    }
    
    public void setTrainConnecter(String trainConnecter) {
        this.trainConnecter = trainConnecter;
    }
    
    @Column(name="train_phone")

    public String getTrainPhone() {
        return this.trainPhone;
    }
    
    public void setTrainPhone(String trainPhone) {
        this.trainPhone = trainPhone;
    }
    
    @Column(name="train_mobile")

    public String getTrainMobile() {
        return this.trainMobile;
    }
    
    public void setTrainMobile(String trainMobile) {
        this.trainMobile = trainMobile;
    }
    
    @Column(name="train_email")

    public String getTrainEmail() {
        return this.trainEmail;
    }
    
    public void setTrainEmail(String trainEmail) {
        this.trainEmail = trainEmail;
    }
    
    @Column(name="train_qq")

    public String getTrainQq() {
        return this.trainQq;
    }
    
    public void setTrainQq(String trainQq) {
        this.trainQq = trainQq;
    }
    
    @Column(name="train_focus_count")

    public Integer getTrainFocusCount() {
        return this.trainFocusCount;
    }
    
    public void setTrainFocusCount(Integer trainFocusCount) {
        this.trainFocusCount = trainFocusCount;
    }
    
    @Column(name="train_status")

    public Integer getTrainStatus() {
        return this.trainStatus;
    }
    
    public void setTrainStatus(Integer trainStatus) {
        this.trainStatus = trainStatus;
    }
    
    @Column(name="train_type")

    public Integer getTrainType() {
        return this.trainType;
    }
    
    public void setTrainType(Integer trainType) {
        this.trainType = trainType;
    }
    
    @Column(name="train_teacher")

    public String getTrainTeacher() {
        return this.trainTeacher;
    }
    
    public void setTrainTeacher(String trainTeacher) {
        this.trainTeacher = trainTeacher;
    }
    
    @Column(name="train_company_name")

    public String getTrainCompanyName() {
        return this.trainCompanyName;
    }
    
    public void setTrainCompanyName(String trainCompanyName) {
        this.trainCompanyName = trainCompanyName;
    }
    
    @Column(name="train_company_email")

    public String getTrainCompanyEmail() {
        return this.trainCompanyEmail;
    }
    
    public void setTrainCompanyEmail(String trainCompanyEmail) {
        this.trainCompanyEmail = trainCompanyEmail;
    }
    
    @Column(name="train_require", length=65535)

    public String getTrainRequire() {
        return this.trainRequire;
    }
    
    public void setTrainRequire(String trainRequire) {
        this.trainRequire = trainRequire;
    }
    
    @Column(name="train_question_challenge", length=65535)

    public String getTrainQuestionChallenge() {
        return this.trainQuestionChallenge;
    }
    
    public void setTrainQuestionChallenge(String trainQuestionChallenge) {
        this.trainQuestionChallenge = trainQuestionChallenge;
    }
    
    @Column(name="train_content_outline", length=65535)

    public String getTrainContentOutline() {
        return this.trainContentOutline;
    }
    
    public void setTrainContentOutline(String trainContentOutline) {
        this.trainContentOutline = trainContentOutline;
    }
    
    @Column(name="train_company_des", length=65535)

    public String getTrainCompanyDes() {
        return this.trainCompanyDes;
    }
    
    public void setTrainCompanyDes(String trainCompanyDes) {
        this.trainCompanyDes = trainCompanyDes;
    }
    
    @Column(name="train_other", length=65535)

    public String getTrainOther() {
        return this.trainOther;
    }
    
    public void setTrainOther(String trainOther) {
        this.trainOther = trainOther;
    }
    
    @Column(name="train_img1")

    public String getTrainImg1() {
        return this.trainImg1;
    }
    
    public void setTrainImg1(String trainImg1) {
        this.trainImg1 = trainImg1;
    }
    
    @Column(name="train_img2")

    public String getTrainImg2() {
        return this.trainImg2;
    }
    
    public void setTrainImg2(String trainImg2) {
        this.trainImg2 = trainImg2;
    }
    
    @Column(name="train_img3")

    public String getTrainImg3() {
        return this.trainImg3;
    }
    
    public void setTrainImg3(String trainImg3) {
        this.trainImg3 = trainImg3;
    }

    @Column(name="train_user_id")
	public Integer getTrainUserId() {
		return trainUserId;
	}

	public void setTrainUserId(Integer trainUserId) {
		this.trainUserId = trainUserId;
	}
}