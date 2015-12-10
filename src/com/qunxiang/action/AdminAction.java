package com.qunxiang.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.qunxiang.bean.Business;
import com.qunxiang.bean.Comment;
import com.qunxiang.bean.Data;
import com.qunxiang.bean.Department;
import com.qunxiang.bean.Industry;
import com.qunxiang.bean.Question;
import com.qunxiang.bean.Train;
import com.qunxiang.bean.User;
import com.qunxiang.bean.Vote;
import com.qunxiang.dao.BusinessDao;
import com.qunxiang.dao.CommentDao;
import com.qunxiang.dao.DataDao;
import com.qunxiang.dao.DepartmentDao;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.QuestionDao;
import com.qunxiang.dao.TrainDao;
import com.qunxiang.dao.TrainVoteDao;
import com.qunxiang.dao.UserDao;
import com.qunxiang.util.UpLoadFile;

import comm.qunxiang.constant.Constant;

/**
 * 后台管理控制器
 * @author user
 */
@Controller
@Scope("prototype")
public class AdminAction {
	
	@Autowired
	private DataDao dataDao;
	@Autowired
	private BusinessDao businessDao;
	@Autowired
	private TrainVoteDao trainVoteDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private IndustryDao industryDao;
	private List<Business> businessList;
	private List<Train> trainList;
	private List<Vote> voteList;
	private List<Question> questionList;
	private List<Comment> commentList;
	private List<User> userList;
	private List<Department> departmentList;
	private List<Industry> industryList;
	private List<Data> logoList;
	
	private String username;
	private String password;
	private String error;
	private String commonType;
	private Integer commonId;
	private String commonName;
	private Integer commonStatus;
	private Question question;
	private String[] flags = new String[]{};
	private File[] files;
	private String[] filesFileName;
	public String checkLogin(){
		Data data = dataDao.findSingle("dataDescription", Constant.ADMININFO);
		//数据中的数据为  admin;123456
		if(username.equals(data.getDataContent().split(";")[0]) && password.equals(data.getDataContent().split(";")[1])){
			return "loginSuccess";
		}else{
			error = "用户名或者密码有误！";
			return "loginFail";
		}
	}
	
	public String indexUI(){
		return "indexUI";
	}
	
	public String loginUI(){
		return "loginUI";
	}
	
	public String businessUI(){
		businessList = businessDao.findAll();
		return "businessUI";
	}
	
	public String trainUI(){
		trainList = trainDao.findAll();
		return "trainUI";
	}
	
	public String voteUI(){
		voteList = trainVoteDao.findAll();
		return "voteUI";
	}
	
	//审核的通用方法
	public String verifyEntityByTypeAndStatus(){
		if(commonType.equals("business")){
			Business business = businessDao.get(Business.class, commonId);
			business.setBusinessStatus(commonStatus);
			businessDao.updateBusiness(business);
			return "verifyBusiness";
		}else if(commonType.equals("train")){
			Train train = trainDao.get(Train.class, commonId);
			train.setTrainStatus(commonStatus);
			trainDao.updateTrain(train);
			return "verifyTrain";
		}else{
			Vote vote = trainVoteDao.get(Vote.class, commonId);
			vote.setVoteStatus(commonStatus);
			trainVoteDao.updateVote(vote);
			return "verifyVote";
		}
	}
	
	public String userUI(){
		userList = userDao.findAll();
		return "userUI";
	}
	
	public void deleteUser() throws Exception{
		User user = userDao.get(User.class, commonId);
		userDao.delete(user);
		
		List<Business> businesses = businessDao.findByProperty("businessUserId", user.getUserId());
		List<Train> trains = trainDao.findByProperty("trainUserId", user.getUserId());
		List<Vote> votes = trainVoteDao.findByProperty("voteUserId", user.getUserId());
		if(businesses != null && businesses.size() > 0){
			for (int i = 0; i < businesses.size(); i++) {
				businessDao.delete(businesses.get(i));
			}
		}
		if(trains != null && trains.size() > 0){
			for (int i = 0; i < trains.size(); i++) {
				trainDao.delete(trains.get(i));
			}
		}
		if(votes != null && votes.size() > 0){
			for (int i = 0; i < votes.size(); i++) {
				trainVoteDao.delete(votes.get(i));
			}
		}
	}
	
	public String categoryUI(){
		industryList = industryDao.findAll();
		departmentList = departmentDao.findAll();
		return "categoryUI";
	}
	
	public void commonDeleteType(){
		if(commonType.equals("industry")){
			industryDao.delete("industryId", commonId);
		}else if(commonType.equals("department")){
			departmentDao.delete("departmentId", commonId);
		}
	}
	
	public void commonAddType(){
		if(commonType.equals("industry")){
			Industry industry = new Industry(commonName);
			industryDao.save(industry);
		}else if(commonType.equals("department")){
			Department department = new Department(commonName);
			departmentDao.save(department);
		}
	}

	public void commonUpdateType(){
		if(commonType.equals("industry")){
			Industry industry = industryDao.findSingle("industryId", commonId);
			industry.setIndustryName(commonName);
			industryDao.update(industry);
		}else if(commonType.equals("department")){
			Department department = departmentDao.findSingle("departmentId", commonId);
			department.setDepartmentName(commonName);
			departmentDao.update(department);
		}
	}
	
	public String manageLogoUI(){
		logoList = dataDao.findByValue("首页滚动图");
		return "manageLogoUI";
	}
	
	public String updateLogo() throws Exception{
		if(files != null && files.length > 0){
			logoList = dataDao.findByValue("首页滚动图");
			for(int i=0;i<files.length;i++){
				String fileName = UpLoadFile.upload(files[i], filesFileName[i]);
				if(flags[i].equals("logo1")){
					UpLoadFile.delete(logoList.get(0).getDataContent());
					logoList.get(0).setDataContent(fileName);
					dataDao.update(logoList.get(0));
				}else if(flags[i].equals("logo2")){
					UpLoadFile.delete(logoList.get(1).getDataContent());
					logoList.get(1).setDataContent(fileName);
					dataDao.update(logoList.get(1));
				}else if(flags[i].equals("logo3")){
					UpLoadFile.delete(logoList.get(2).getDataContent());
					logoList.get(2).setDataContent(fileName);
					dataDao.update(logoList.get(2));
				}else if(flags[i].equals("logo4")){
					UpLoadFile.delete(logoList.get(3).getDataContent());
					logoList.get(3).setDataContent(fileName);
					dataDao.update(logoList.get(3));
				}
			}
		}
		return "updateLogo";
	}
	
	public String questionUI(){
		questionList = questionDao.findAll();
		return "questionUI";
	}
	
	public String toAddQuestionUI(){
		return "toAddQuestionUI";
	}
	
	public String addQuestion(){
		questionDao.save(question);
		return "addQuestion";
	}
	
	public String toUpdateQuestionUI(){
		question = questionDao.get(Question.class, commonId);
		return "toUpdateQuestionUI";
	}
	
	public String updateQuestion(){
		questionDao.update(question);
		return "updateQuestion";
	}
	
	public String deleteQuestion(){
		questionDao.delete(questionDao.get(Question.class, commonId));
		return "deleteQuestion";
	}
	
	public String commentUI(){
		commentList = commentDao.findAll();
		return "commentUI";
	}
	
	public void deleteComment() throws Exception{
		commentDao.delete(commentDao.get(Comment.class, commonId));
		ServletActionContext.getResponse().getWriter().print("success");
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public List<Business> getBusinessList() {
		return businessList;
	}

	public void setBusinessList(List<Business> businessList) {
		this.businessList = businessList;
	}

	public List<Train> getTrainList() {
		return trainList;
	}

	public void setTrainList(List<Train> trainList) {
		this.trainList = trainList;
	}

	public List<Vote> getVoteList() {
		return voteList;
	}

	public void setVoteList(List<Vote> voteList) {
		this.voteList = voteList;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public String getCommonType() {
		return commonType;
	}

	public void setCommonType(String commonType) {
		this.commonType = commonType;
	}

	public Integer getCommonId() {
		return commonId;
	}

	public void setCommonId(Integer commonId) {
		this.commonId = commonId;
	}

	public Integer getCommonStatus() {
		return commonStatus;
	}

	public void setCommonStatus(Integer commonStatus) {
		this.commonStatus = commonStatus;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public List<Industry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<Industry> industryList) {
		this.industryList = industryList;
	}

	public String getCommonName() {
		return commonName;
	}

	public void setCommonName(String commonName) {
		this.commonName = commonName;
	}

	public List<Data> getLogoList() {
		return logoList;
	}

	public void setLogoList(List<Data> logoList) {
		this.logoList = logoList;
	}


	public String[] getFlags() {
		return flags;
	}

	public void setFlags(String[] flags) {
		this.flags = flags;
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFilesFileName() {
		return filesFileName;
	}

	public void setFilesFileName(String[] filesFileName) {
		this.filesFileName = filesFileName;
	}
}
