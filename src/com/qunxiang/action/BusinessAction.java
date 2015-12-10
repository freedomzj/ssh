package com.qunxiang.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Business;
import com.qunxiang.bean.Comment;
import com.qunxiang.bean.Department;
import com.qunxiang.bean.Industry;
import com.qunxiang.bean.Reply;
import com.qunxiang.bean.User;
import com.qunxiang.dao.BusinessDao;
import com.qunxiang.dao.CommentDao;
import com.qunxiang.dao.DepartmentDao;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.ReplyDao;
import com.qunxiang.util.UpLoadFile;

@Controller
public class BusinessAction {
	
	@Autowired
	private BusinessDao businessDao;
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private IndustryDao industryDao;
	
	@Autowired
	private DepartmentDao departmentDao;
	
	
	private Business business;
	private File file;
	private String fileFileName;
	private File[] files;
	private String[] filesFileNames;
	private String businessType;
	private List<Business> person;
	private List<Business> personSupply;//1供应
	private List<Business> personDemand;//2需求
	private Integer businessId;
	private Integer rating;//好评度
	private String ratingDes;//好评描述
	private List<CommentVO> businessRatingList;
	private String content;//回复内容
	private Integer commentId;//回复id
	private Integer tradeId;
	private PageDesc pageDesc;
	private String type;
	private Integer departmetnId;
	private String industryName;
	
	
	private List<Industry> industryList;
	
	private List<Department> departmetnList;
	
	//执行添加业务能人操作
	public String doUserUpload() throws Exception{
		if(businessType.equals("gongying")){
			//供应
			business.setBusinessType(1);
			for(int i=0;i<files.length;i++){
				String fileName = UpLoadFile.upload(files[i], filesFileNames[i]);
				if(i == 0){
					business.setBusinessImg1(fileName);
				}else if(i == 2){
					business.setBusinessImg2(fileName);
				}
			}
		}else if(businessType.equals("xuqiu")){
			//需求
			business.setBusinessType(2);
			String fileName = UpLoadFile.upload(file, fileFileName);
			business.setBusinessImg1(fileName);
		}
		business.setBusinessStatus(0);
		businessDao.addBusiness(business);
		return "doUserUpload";
	}
	
	public String businessList(){
//		person=businessDao.findAll();
		
		if(pageDesc == null) {
			pageDesc =new PageDesc();
			pageDesc.setPageSize(8);
			pageDesc.setPageNo(1);
		}
		List<String> propertyName=new ArrayList<String>();
		List<Object> value=new ArrayList<Object>();
		propertyName.add("businessStatus");
		value.add(1);
		if(tradeId!=null&&tradeId!=-1){
			propertyName.add("businessIndustryId");
			value.add(tradeId);
		}
//		if(departmetnId!=null){
//			propertyName.add("businessDepartmentId");
//			value.add(departmetnId);
//			
//		}
		person=businessDao.findBusinessByPageDesc(propertyName, value, "desc", pageDesc);
		
		industryList=industryDao.findAll();
		departmetnList=departmentDao.findAll();
		
		if(type!=null&&type.equals("rating")){
			personSupply=businessDao.findBusinessByTypeAndOrder(1, "desc");
			type=null;
		}else{
			personSupply=businessDao.findBusinessByType(1);
		}
		personDemand=businessDao.findBusinessByTypeAndOrder(2, "desc");
		
		
		return "businessList";
	}
	
	//通过id加载行业部门名称
	public void ajaxindustyById() throws IOException{
		Industry industry=industryDao.get(Industry.class, tradeId);
		String industryName=industry.getIndustryName();
		ServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(industryName);
	}
	

	
	//到业务能人页面
	public String businessIn(){
		business=businessDao.get(Business.class, businessId);
		businessRatingList=businessDao.findCommentById(business.getBusinessId());
		Industry industry=industryDao.get(Industry.class, business.getBusinessIndustryId());
		 industryName=industry.getIndustryName();
		return "businessIn";
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
	
	public Integer totalRating(Integer businessId){
		List<Comment> commentList=commentDao.findBusinessComment(businessId);
		Integer count=0;
		 for (int i = 0; i < commentList.size(); i++) {
			 Comment com=commentList.get(i);
			 count+=com.getCommentRating();
		}
		if(count!=0){
			return count/commentList.size();
		}else{
			return 0;
		}
		
	}
	//点评
	public void ajaxBusinessComment(){
		Comment comment=new Comment();
		User user= (User) ServletActionContext.getContext().getSession().get("user");
		if(user!=null){
			comment.setCommentUserId(user.getUserId());
		}else{
			comment.setCommentUserId(999999);//匿名用户
		}
		comment.setCommentBusinessId(businessId);
		Date date = new Date();
		Timestamp nousedate = new Timestamp(date.getTime());
		comment.setCommentTime(nousedate);
		comment.setCommentContent(ratingDes);
		comment.setCommentRating(rating);
		commentDao.save(comment);
		Integer businessRating=totalRating(businessId);
		Business business=businessDao.get(Business.class, businessId);
		business.setBusinessFocusCount(businessRating);
		businessDao.update(business);
	}
	
	
	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFilesFileNames() {
		return filesFileNames;
	}

	public void setFilesFileNames(String[] filesFileNames) {
		this.filesFileNames = filesFileNames;
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

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	
	public List<Business> getPerson() {
		return person;
	}

	public void setPerson(List<Business> person) {
		this.person = person;
	}

	public List<Business> getPersonSupply() {
		return personSupply;
	}

	public void setPersonSupply(List<Business> personSupply) {
		this.personSupply = personSupply;
	}

	public List<Business> getPersonDemand() {
		return personDemand;
	}

	public void setPersonDemand(List<Business> personDemand) {
		this.personDemand = personDemand;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
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

	public List<CommentVO> getBusinessRatingList() {
		return businessRatingList;
	}

	public void setBusinessRatingList(List<CommentVO> businessRatingList) {
		this.businessRatingList = businessRatingList;
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
	


	public Integer getTradeId() {
		return tradeId;
	}

	public void setTradeId(Integer tradeId) {
		this.tradeId = tradeId;
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

	public List<Department> getDepartmetnList() {
		return departmetnList;
	}

	public void setDepartmetnList(List<Department> departmetnList) {
		this.departmetnList = departmetnList;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getDepartmetnId() {
		return departmetnId;
	}

	public void setDepartmetnId(Integer departmetnId) {
		this.departmetnId = departmetnId;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	
	

	
	
}
