package com.qunxiang.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletResponse;

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
import com.qunxiang.bean.Train;
import com.qunxiang.bean.User;
import com.qunxiang.bean.Vote;
import com.qunxiang.dao.CommentDao;
import com.qunxiang.dao.DepartmentDao;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.ReplyDao;
import com.qunxiang.dao.TrainDao;
import com.qunxiang.dao.TrainVoteDao;
import com.qunxiang.util.UpLoadFile;
import comm.qunxiang.constant.Constant;

@Controller
@Scope("prototype")
public class TrainChooseAction {
	
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	
	@Autowired
	private IndustryDao industryDao;
	
	private List<Industry> industryList;
	
	private Train train;
	private String trainType;
	private File file;
	private String fileFileName;
	private File[] files;
	private String[] fileFileNames;
	private List<Train> trainList;
	private List<Train> trainSupply;//供应
	private List<Train> trainDemand;//需求
	private Integer trainId;
	private Integer rating;//好评度
	private String ratingDes;//好评描述
	private List<CommentVO> commentTrainList;
	private String content;//回复内容
	private Integer commentId;//回复id
	private PageDesc pageDesc;
	private Integer trainTradeId;
	
	
	public String trainChoose(){
		
		if(pageDesc == null) {
			pageDesc =new PageDesc();
			pageDesc.setPageSize(8);
			pageDesc.setPageNo(1);
		}
		
		trainList=trainDao.findTrainByPageDesc(1, trainTradeId, pageDesc);
		
		trainSupply=trainDao.findTrainByType(Constant.TRAINCHOESSSUPPLY);
		trainDemand=trainDao.findTrainByType(Constant.TRAINCHOESSDEMAND);
		
		
		industryList=industryDao.findAll();
		
		return "trainChoose";
	}
	//培训投票详情页
	public String trainChooseIn(){
		train=trainDao.get(Train.class, trainId);
		commentTrainList=trainDao.findCommentById(train.getTrainId());
		return "trainChooseIn";
	}
	
	//执行添加培训结构操作
	public String doTrainUpload() throws Exception{
		if(trainType.equals("gongying")){
			train.setTrainType(1);
			for(int i=0;i<files.length;i++){
				String fileName = UpLoadFile.upload(files[i], fileFileNames[i]);
				if(i == 0){
					train.setTrainImg1(fileName);
				}else if(i == 2){
					train.setTrainImg2(fileName);
				}
			}
		}else if(trainType.equals("xuqiu")){
			train.setTrainType(2);
			String fileName = UpLoadFile.upload(file, fileFileName);
			train.setTrainImg1(fileName);
		}
		train.setTrainStatus(0);
		train.setTrainFocusCount(0);
		trainDao.addTrain(train);
		return "doTrainUpload";
	}
	
	
	//点评
	public void AjaxTrainComment(){
		Comment comment=new Comment();
		User user= (User) ServletActionContext.getContext().getSession().get("user");
		if(user!=null){
			comment.setCommentUserId(user.getUserId());
		}else{
			comment.setCommentUserId(999999);//匿名用户
		}
		comment.setCommentTrainId(trainId);
		Date date = new Date();
		Timestamp nousedate = new Timestamp(date.getTime());
		comment.setCommentTime(nousedate);
		comment.setCommentContent(ratingDes);
		comment.setCommentRating(rating);
		commentDao.save(comment);
		
	}
	//回复
	public void ajaxTrainReply() throws IOException{
		
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
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFileFileNames() {
		return fileFileNames;
	}

	public void setFileFileNames(String[] fileFileNames) {
		this.fileFileNames = fileFileNames;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	public String getTrainType() {
		return trainType;
	}

	public void setTrainType(String trainType) {
		this.trainType = trainType;
	}

	public List<Train> getTrainList() {
		return trainList;
	}

	public void setTrainList(List<Train> trainList) {
		this.trainList = trainList;
	}

	public List<Train> getTrainSupply() {
		return trainSupply;
	}

	public void setTrainSupply(List<Train> trainSupply) {
		this.trainSupply = trainSupply;
	}

	public List<Train> getTrainDemand() {
		return trainDemand;
	}

	public void setTrainDemand(List<Train> trainDemand) {
		this.trainDemand = trainDemand;
	}
	public Integer getTrainId() {
		return trainId;
	}
	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public String getRatingDes() {
		return ratingDes;
	}
	public void setRatingDes(String ratingDes) {
		this.ratingDes = ratingDes;
	}
	public List<CommentVO> getCommentTrainList() {
		return commentTrainList;
	}
	public void setCommentTrainList(List<CommentVO> commentTrainList) {
		this.commentTrainList = commentTrainList;
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
	public PageDesc getPageDesc() {
		return pageDesc;
	}
	public void setPageDesc(PageDesc pageDesc) {
		this.pageDesc = pageDesc;
	}
	public List<Industry> getIndustryList() {
		return industryList;
	}
	public void setIndustryList(List<Industry> industryList) {
		this.industryList = industryList;
	}
	public Integer getTrainTradeId() {
		return trainTradeId;
	}
	public void setTrainTradeId(Integer trainTradeId) {
		this.trainTradeId = trainTradeId;
	}
	

	
	
	
	
	
	
}
