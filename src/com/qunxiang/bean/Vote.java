package com.qunxiang.bean;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Vote entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="vote"
    ,catalog="qunxiang"
)

public class Vote  implements java.io.Serializable {


    // Fields    

     private Integer voteId;
     private String voteTitle;
     private String voteRequire;
     private String voteQuestionChallenge;
     private String voteContentOutline;
     private String voteCompanyName;
     private String voteConnecter;
     private String voteMobile;
     private String votePhone;
     private String voteQq;
     private String voteOther;
     private Timestamp publishTime;
     private String auther;
     private Integer voteCommentCount;
     private Integer voteFocusCount;
     private Integer voteViewCount;
     private Integer voteIndustryId;
     private Integer voteUserId;
     private Integer voteType;
     private Integer voteStatus;
     private String voteEmail;


    // Constructors

    /** default constructor */
    public Vote() {
    }

    
    /** full constructor */
    public Vote(String voteTitle, String voteRequire, String voteQuestionChallenge, String voteContentOutline, String voteCompanyName, String voteConnecter, String voteMobile, String votePhone, String voteQq, String voteOther, Timestamp publishTime, String auther, Integer voteCommentCount, Integer voteFocusCount, Integer voteViewCount, Integer voteIndustryId, Integer voteType, Integer voteStatus) {
        this.voteTitle = voteTitle;
        this.voteRequire = voteRequire;
        this.voteQuestionChallenge = voteQuestionChallenge;
        this.voteContentOutline = voteContentOutline;
        this.voteCompanyName = voteCompanyName;
        this.voteConnecter = voteConnecter;
        this.voteMobile = voteMobile;
        this.votePhone = votePhone;
        this.voteQq = voteQq;
        this.voteOther = voteOther;
        this.publishTime = publishTime;
        this.auther = auther;
        this.voteCommentCount = voteCommentCount;
        this.voteFocusCount = voteFocusCount;
        this.voteViewCount = voteViewCount;
        this.voteIndustryId = voteIndustryId;
        this.voteType = voteType;
        this.voteStatus = voteStatus;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="vote_id", unique=true, nullable=false)

    public Integer getVoteId() {
        return this.voteId;
    }
    
    public void setVoteId(Integer voteId) {
        this.voteId = voteId;
    }
    
    @Column(name="vote_title")

    public String getVoteTitle() {
        return this.voteTitle;
    }
    
    
    

    @Column(name="vote_email")
	public String getVoteEmail() {
		return voteEmail;
	}


	public void setVoteEmail(String voteEmail) {
		this.voteEmail = voteEmail;
	}


	public void setVoteTitle(String voteTitle) {
        this.voteTitle = voteTitle;
    }
    
    @Column(name="vote_require", length=65535)

    public String getVoteRequire() {
        return this.voteRequire;
    }
    
    public void setVoteRequire(String voteRequire) {
        this.voteRequire = voteRequire;
    }
    
    @Column(name="vote_question_challenge", length=65535)

    public String getVoteQuestionChallenge() {
        return this.voteQuestionChallenge;
    }
    
    public void setVoteQuestionChallenge(String voteQuestionChallenge) {
        this.voteQuestionChallenge = voteQuestionChallenge;
    }
    
    @Column(name="vote_content_outline", length=65535)

    public String getVoteContentOutline() {
        return this.voteContentOutline;
    }
    
    public void setVoteContentOutline(String voteContentOutline) {
        this.voteContentOutline = voteContentOutline;
    }
    
    @Column(name="vote_company_name")

    public String getVoteCompanyName() {
        return this.voteCompanyName;
    }
    
    public void setVoteCompanyName(String voteCompanyName) {
        this.voteCompanyName = voteCompanyName;
    }
    
    @Column(name="vote_connecter")

    public String getVoteConnecter() {
        return this.voteConnecter;
    }
    
    public void setVoteConnecter(String voteConnecter) {
        this.voteConnecter = voteConnecter;
    }
    
    @Column(name="vote_mobile")

    public String getVoteMobile() {
        return this.voteMobile;
    }
    
    public void setVoteMobile(String voteMobile) {
        this.voteMobile = voteMobile;
    }
    
    @Column(name="vote_phone")

    public String getVotePhone() {
        return this.votePhone;
    }
    
    public void setVotePhone(String votePhone) {
        this.votePhone = votePhone;
    }
    
    @Column(name="vote_qq")

    public String getVoteQq() {
        return this.voteQq;
    }
    
    public void setVoteQq(String voteQq) {
        this.voteQq = voteQq;
    }
    
    @Column(name="vote_other")

    public String getVoteOther() {
        return this.voteOther;
    }
    
    public void setVoteOther(String voteOther) {
        this.voteOther = voteOther;
    }
    
    @Column(name="publish_time", length=19)

    public Timestamp getPublishTime() {
        return this.publishTime;
    }
    
    public void setPublishTime(Timestamp publishTime) {
        this.publishTime = publishTime;
    }
    
    @Column(name="auther")

    public String getAuther() {
        return this.auther;
    }
    
    public void setAuther(String auther) {
        this.auther = auther;
    }
    
    @Column(name="vote_comment_count")

    public Integer getVoteCommentCount() {
        return this.voteCommentCount;
    }
    
    public void setVoteCommentCount(Integer voteCommentCount) {
        this.voteCommentCount = voteCommentCount;
    }
    
    @Column(name="vote_focus_count")

    public Integer getVoteFocusCount() {
        return this.voteFocusCount;
    }
    
    public void setVoteFocusCount(Integer voteFocusCount) {
        this.voteFocusCount = voteFocusCount;
    }
    
    @Column(name="vote_view_count")

    public Integer getVoteViewCount() {
        return this.voteViewCount;
    }
    
    public void setVoteViewCount(Integer voteViewCount) {
        this.voteViewCount = voteViewCount;
    }
    
    @Column(name="vote_industry_id")

    public Integer getVoteIndustryId() {
        return this.voteIndustryId;
    }
    
    public void setVoteIndustryId(Integer voteIndustryId) {
        this.voteIndustryId = voteIndustryId;
    }
    
    @Column(name="vote_type")

    public Integer getVoteType() {
        return this.voteType;
    }
    
    public void setVoteType(Integer voteType) {
        this.voteType = voteType;
    }
    
    @Column(name="vote_status")

    public Integer getVoteStatus() {
        return this.voteStatus;
    }
    
    public void setVoteStatus(Integer voteStatus) {
        this.voteStatus = voteStatus;
    }

    @Column(name="vote_user_id")
	public Integer getVoteUserId() {
		return voteUserId;
	}


	public void setVoteUserId(Integer voteUserId) {
		this.voteUserId = voteUserId;
	}
}