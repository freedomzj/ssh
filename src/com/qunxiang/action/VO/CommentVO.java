package com.qunxiang.action.VO;

import java.sql.Timestamp;

public class CommentVO  {

	
	private Integer userId;
	
	private String content;
	
	private String userName;
	
	private String userImg;
	
	private Timestamp time;
	
	private Integer commentId;
	private Integer rating;
	

	public CommentVO() {
	}

	public CommentVO(Integer userId, String content, String userName,
			String userImg, Timestamp time,Integer commentId,Integer rating) {
		this.userId = userId;
		this.content = content;
		this.userName = userName;
		this.userImg = userImg;
		this.time = time;
		this.commentId=commentId;
		this.rating=rating;
	}




	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}



	public Timestamp getTime() {
		return time;
	}



	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}


	
	

	
	
}
