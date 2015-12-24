package com.qunxiang.bean;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


/**
 * Reply entity. @author MyEclipse Persistence Tools
 */
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
@Entity
@Table(name="reply"
    ,catalog="qunxiang"
)

public class Reply  implements java.io.Serializable {


    // Fields    

     private Integer replyId;
     private String replyContent;
     private Date replyTime;
     private Integer replyCommentId;
     private String replyUserName;
     private String replyUserImg;
     
    // Constructors

    /** default constructor */
    public Reply() {
    }

    public Reply(Integer replyId, String replyContent, Timestamp replyTime,
			Integer replyCommentId, String replyUserName, String replyUserImg) {
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.replyTime = replyTime;
		this.replyCommentId = replyCommentId;
		this.replyUserName = replyUserName;
		this.replyUserImg = replyUserImg;
	}


	// Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="reply_id", unique=true, nullable=false)

    public Integer getReplyId() {
        return this.replyId;
    }
    
    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }
    
    @Column(name="reply_content", length=65535)

    public String getReplyContent() {
        return this.replyContent;
    }
    
    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }
    
    @Column(name="reply_time", length=19)
    public Date getReplyTime() {
        return this.replyTime;
    }
    
    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    @Column(name="reply_comment_id")
	public Integer getReplyCommentId() {
		return replyCommentId;
	}

	public void setReplyCommentId(Integer replyCommentId) {
		this.replyCommentId = replyCommentId;
	}

	@Column(name="reply_user_name")
	public String getReplyUserName() {
		return replyUserName;
	}

	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}

	@Column(name="reply_user_img")
	public String getReplyUserImg() {
		return replyUserImg;
	}

	public void setReplyUserImg(String replyUserImg) {
		this.replyUserImg = replyUserImg;
	}
    
    

    








}