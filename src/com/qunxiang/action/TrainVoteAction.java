package com.qunxiang.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Comment;
import com.qunxiang.bean.Department;
import com.qunxiang.bean.Industry;
import com.qunxiang.bean.Reply;
import com.qunxiang.bean.User;
import com.qunxiang.bean.Vote;
import com.qunxiang.dao.BaseDao;
import com.qunxiang.dao.CommentDao;
import com.qunxiang.dao.DepartmentDao;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.ReplyDao;
import com.qunxiang.dao.TrainVoteDao;
import com.qunxiang.util.JsonDateValueProcessor;

import comm.qunxiang.constant.Constant;

@Controller
@Scope("prototype")
public class TrainVoteAction {

	@Autowired
	private TrainVoteDao trainVoteDao;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private IndustryDao industryDao;
	
	@Autowired
	private DepartmentDao departmentDao;
	
	private List<Vote> voteList;
	private List<Vote> trainSupply;//供应
	private List<Vote> trainDemand;//需求
	private String type;
	private Integer voteId;
	private String voteType;
	private Vote vote;
	private List<CommentVO> commentList;
	private String content;//回复内容
	private Integer commentId;//回复id
	private List<Reply> replyList;
	private List<Industry> industryList;
	private Vote voteNext;
	private Vote voteLast;
	private PageDesc pageDesc;
	private Integer commentCount;
	private List<Department> departmetnList;
	private Integer voteTradeId;
	//点赞
	public void ajaxUpdateFocusCount() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		Vote vote= trainVoteDao.get(Vote.class, voteId);
		String address = request.getRemoteAddr();//获取用户ip
		Cookie cookie = null;
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			Cookie temp = cookies[i];
			if(temp.getValue().equals(address+vote.getVoteId())){
				flag = true;
				break;
			}
		}
		if(flag){
			//已经点赞
			response.getWriter().print("fail");
		}else{
			//没有点赞，添加数据,修改点赞次数
			cookie = new Cookie(address+vote.getVoteId(), address+vote.getVoteId());
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			//点赞之前判断用户是否已经点过  (1.ip是否相同  2.投票对象是否相同   3.时间是否超过一天,此处只需要将cookie的生命周期设置为1天就ok)
			vote.setVoteFocusCount(vote.getVoteFocusCount()+1);
			trainVoteDao.update(vote);
			response.getWriter().print(vote.getVoteFocusCount());
		}
	};
	
	public void ajaxLodeRepy() throws IOException{
		replyList=replyDao.findByProperty("replyCommentId", commentId);
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		JSONArray array = JSONArray.fromObject(replyList,config);
		ServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(array);
	}
	//回复评论
	public void ajaxVoteReply() throws IOException{
		ServletResponse response=ServletActionContext.getResponse();
		Reply reply=new Reply();
		User user= (User) ServletActionContext.getContext().getSession().get("user");
		if(content.length()>10&&content.length()<300){
			if(user!=null){
				reply.setReplyUserImg(user.getUserImg1());
				reply.setReplyUserName(user.getUsername());
			}
			else{
				reply.setReplyUserImg("upload/niming.jpg");
				reply.setReplyUserName("匿名用户");
			}
			reply.setReplyCommentId(commentId);
			reply.setReplyContent(content);
			reply.setReplyTime(new Date());
			
			replyDao.save(reply);
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
		
	}
	public String trainVoteIn(){
		vote=trainVoteDao.get(Vote.class,voteId);
		//增加浏览次数
		
		//计算回复次数
		commentCount=totalReplyCount(voteId);
		if(vote.getVoteViewCount()==null){
			vote.setVoteViewCount(1);
		}else{
			vote.setVoteViewCount(vote.getVoteViewCount()+1);
		}
		
		trainVoteDao.update(vote);
		//加载评论
		commentList=trainVoteDao.findCommentById(vote.getVoteId());
		//加载评论的回复
        //加载上一篇和下一篇
		voteList=trainVoteDao.findAll();
		if(voteList.size()==1){
			voteNext=null;
			voteLast=null;
		}else{
			for (int i = 0; i < voteList.size(); i++) {
				int index=-1;
				int newsBean=vote.getVoteId();
				int listBean=voteList.get(i).getVoteId();
				if(newsBean==listBean){
					index=i;
				}
				if(index!=-1){
					if(index==0){
						voteNext=voteList.get(index+1);
						voteLast=null;
					}
					if(index==voteList.size()-1){
						voteLast=voteList.get(index-1);
						voteNext=null;
					}
					if(index!=0&&index!=voteList.size()-1){
						voteLast=voteList.get(index-1);
						voteNext=voteList.get(index+1);
					}
					break;
				}
			}
		}
		return "trainVoteIn";
		
	}
	
	public Integer totalReplyCount(Integer voteId){
		List<Comment> commentList=commentDao.findCommentByVoteId(voteId);
		if(commentList!=null){
			return commentList.size();
		}
		else{
			return 0;
		}
		
	}
	//回复
	public void AjaxVoteComment(){
		Comment comment=new Comment();
		User user= (User) ServletActionContext.getContext().getSession().get("user");
		if(user!=null){
			comment.setCommentUserId(user.getUserId());
		}else{
			comment.setCommentUserId(999999);//匿名用户
		}
		comment.setCommentVoteId(voteId);
		Date date = new Date();
		Timestamp nousedate = new Timestamp(date.getTime());
		comment.setCommentTime(nousedate);
		comment.setCommentContent(content);
		commentDao.save(comment);
	}
	
	//培训投票页面
	public String trainVote(){
		
		if(pageDesc == null) {
			pageDesc =new PageDesc();
			pageDesc.setPageSize(8);
			pageDesc.setPageNo(1);
		}
		voteList=trainVoteDao.findVoteByPageDesc(1,  voteTradeId, pageDesc);
		if(type!=null&&type.equals("focus")){
			trainSupply=trainVoteDao.findVoteByParam(Constant.TRAINVOTESUPPLY,"voteFocusCount");
			trainDemand=trainVoteDao.findVoteByParam(Constant.TRAINVOTEDEMAND,"voteFocusCount");
			type=null;
		}
		else{
			trainSupply=trainVoteDao.findVoteByState(Constant.TRAINVOTESUPPLY);
			trainDemand=trainVoteDao.findVoteByState(Constant.TRAINVOTEDEMAND);
		}
		//加载行业类型
		industryList=industryDao.findAll();
		return "trainVote";
	}
	
	//执行添加投票操作
	public String doVoteUpload(){
		if(voteType.equals("gongying")){
			vote.setVoteType(1);
		}else if(voteType.equals("xuqiu")){
			vote.setVoteType(2);
		}
		vote.setVoteStatus(0);
		vote.setVoteViewCount(0);
		vote.setVoteFocusCount(0);
		vote.setVoteCommentCount(0);
		vote.setAuther("admin");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		vote.setPublishTime(time);
		trainVoteDao.addVote(vote);
		return "doVoteUpload";
	}
	public static void main(String[] args) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		System.out.println(time);
	}

	public List<Vote> getVoteList() {
		return voteList;
	}


	public void setVoteList(List<Vote> voteList) {
		this.voteList = voteList;
	}


	public List<Vote> getTrainSupply() {
		return trainSupply;
	}

	public void setTrainSupply(List<Vote> trainSupply) {
		this.trainSupply = trainSupply;
	}

	public List<Vote> getTrainDemand() {
		return trainDemand;
	}
	public void setTrainDemand(List<Vote> trainDemand) {
		this.trainDemand = trainDemand;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getVoteId() {
		return voteId;
	}

	public void setVoteId(Integer voteId) {
		this.voteId = voteId;
	}
	public String getVoteType() {
		return voteType;
	}

	public void setVoteType(String voteType) {
		this.voteType = voteType;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

	public List<CommentVO> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentVO> commentList) {
		this.commentList = commentList;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public List<Industry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<Industry> industryList) {
		this.industryList = industryList;
	}

	public PageDesc getPageDesc() {
		return pageDesc;
	}

	public void setPageDesc(PageDesc pageDesc) {
		this.pageDesc = pageDesc;
	}

	public Vote getVoteNext() {
		return voteNext;
	}

	public void setVoteNext(Vote voteNext) {
		this.voteNext = voteNext;
	}

	public Vote getVoteLast() {
		return voteLast;
	}

	public void setVoteLast(Vote voteLast) {
		this.voteLast = voteLast;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public List<Department> getDepartmetnList() {
		return departmetnList;
	}

	public void setDepartmetnList(List<Department> departmetnList) {
		this.departmetnList = departmetnList;
	}

	public Integer getVoteTradeId() {
		return voteTradeId;
	}

	public void setVoteTradeId(Integer voteTradeId) {
		this.voteTradeId = voteTradeId;
	}
	
	
	
}
