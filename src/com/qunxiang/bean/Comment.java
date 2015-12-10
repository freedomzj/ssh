package com.qunxiang.bean;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Comment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="comment"
    ,catalog="qunxiang"
)

public class Comment  implements java.io.Serializable {


    // Fields    

     private Integer commentId;
     private Integer commentUserId;
     private String commentContent;
     private Timestamp commentTime;
     private Integer commentVoteId;
     private Integer commentTrainId;
     private Integer commentBusinessId;
     private Integer commentRating;


    // Constructors

    /** default constructor */
    public Comment() {
    }

    
    /** full constructor */
    public Comment(Integer commentUserId, String commentContent, Timestamp commentTime, Integer commentVoteId, Integer commentTrainId, Integer commentBusinessId) {
        this.commentUserId = commentUserId;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
        this.commentVoteId = commentVoteId;
        this.commentTrainId = commentTrainId;
        this.commentBusinessId = commentBusinessId;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="comment_id", unique=true, nullable=false)

    public Integer getCommentId() {
        return this.commentId;
    }
    
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }
    
    @Column(name="comment_user_id")

    public Integer getCommentUserId() {
        return this.commentUserId;
    }
    
    public void setCommentUserId(Integer commentUserId) {
        this.commentUserId = commentUserId;
    }
    
    @Column(name="comment_content", length=65535)

    public String getCommentContent() {
        return this.commentContent;
    }
    
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    
    @Column(name="comment_time", length=19)

    public Timestamp getCommentTime() {
        return this.commentTime;
    }
    
    public void setCommentTime(Timestamp commentTime) {
        this.commentTime = commentTime;
    }
    
    @Column(name="comment_vote_id")

    public Integer getCommentVoteId() {
        return this.commentVoteId;
    }
    
    public void setCommentVoteId(Integer commentVoteId) {
        this.commentVoteId = commentVoteId;
    }
    
    @Column(name="comment_train_id")

    public Integer getCommentTrainId() {
        return this.commentTrainId;
    }
    
    public void setCommentTrainId(Integer commentTrainId) {
        this.commentTrainId = commentTrainId;
    }
    
    @Column(name="comment_business_id")

    public Integer getCommentBusinessId() {
        return this.commentBusinessId;
    }
    
    public void setCommentBusinessId(Integer commentBusinessId) {
        this.commentBusinessId = commentBusinessId;
    }


    @Column(name="comment_rating")
	public Integer getCommentRating() {
		return commentRating;
	}


	public void setCommentRating(Integer commentRating) {
		this.commentRating = commentRating;
	}


   
    
    








}