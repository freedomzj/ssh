package com.qunxiang.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.qunxiang.bean.Business;
import com.qunxiang.bean.Department;
import com.qunxiang.bean.Industry;
import com.qunxiang.bean.Train;
import com.qunxiang.bean.User;
import com.qunxiang.bean.Vote;
import com.qunxiang.dao.BusinessDao;
import com.qunxiang.dao.DepartmentDao;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.TrainDao;
import com.qunxiang.dao.TrainVoteDao;
import com.qunxiang.dao.UserDao;
import com.qunxiang.util.MD5Util;
import com.qunxiang.util.UpLoadFile;
@Controller
@Scope("prototype")
public class UserAction {
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private TrainVoteDao trainVoteDao;
	@Autowired
	private BusinessDao businessDao;
	@Autowired
	private IndustryDao industryDao;
	@Autowired
	private DepartmentDao departmentDao;
	private User user;
	private String username;
	private String password;
	private String status;
	private String info;
	private String manageType;
	private int userId;
	private String newPassword;
	private File file;
	private String fileFileName;
	private File[] files;
	private String[] filesFileName;
	private List<Business> businessList;
	private List<Vote> voteList;
	private List<Train> trainList;
	private Business business;
	private Vote vote;
	private Train train;
	private String commonType;
	private Integer commonId;
	private List<Industry> industryList;
	private List<Department> departmentList;
	private String[] flags = new String[2];
	//到能人列表模块
	public String toBusinessUI(){
		user = (User) ServletActionContext.getContext().getSession().get("user");
		businessList = businessDao.findByProperty("businessUserId",user.getUserId());
		industryList = industryDao.getAll();
		departmentList = departmentDao.getAll();
		manageType = "business";
		return "toBusinessUI";
	}
	//到培训列表模块
	public String toTrainUI(){
		user = (User) ServletActionContext.getContext().getSession().get("user");
		trainList = trainDao.findByProperty("trainUserId", user.getUserId());
		industryList = industryDao.getAll();
		manageType = "train";
		return "toTrainUI";
	}
	//到投票列表模块
	public String toVoteUI(){
		user = (User) ServletActionContext.getContext().getSession().get("user");
		voteList = trainVoteDao.findByProperty("voteUserId", user.getUserId());
		industryList = industryDao.getAll();
		manageType = "vote";
		return "toVoteUI";
	}
	
	//根据编号查找对象
//	public String findEntityByIdAndType(){
//		if(commonType.equals("business")){
//			business = businessDao.get(Business.class, commonId);
//			return "businessResult";
//		}else if(commonType.equals("train")){
//			train = trainDao.get(Train.class, commonId);
//			return "trainResult";
//		}else if(commonType.equals("vote")){
//			vote = trainVoteDao.get(Vote.class, commonId);
//			return "voteResult";
//		}else{
//			return null;
//		}
//	}
	
	public void findEntityByIdAndType() throws Exception{
		HttpServletResponse response =  ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		JSONObject json = null;
		if(commonType.equals("business")){
			business = businessDao.get(Business.class, commonId);
			json = JSONObject.fromObject(business);
		}else if(commonType.equals("train")){
			train = trainDao.get(Train.class, commonId);
			json = JSONObject.fromObject(train);
		}else if(commonType.equals("vote")){
			vote = trainVoteDao.get(Vote.class, commonId);
			json = JSONObject.fromObject(vote);
		}
		pw.print(json);
	}
	
	public String updateEntityByType() throws Exception{
		if(commonType.equals("business")){
			if(business.getBusinessType() == 1){
				//供应
				if(files != null && files.length > 0){
					for(int i=0;i<files.length;i++){
						String fileName = UpLoadFile.upload(files[i], files[i].getName());
						if(flags[i].equals("businessImg1")){
							UpLoadFile.delete(business.getBusinessImg1());
							business.setBusinessImg1(fileName);
						}else if(flags[i].equals("businessImg2")){
							UpLoadFile.delete(business.getBusinessImg2());
							business.setBusinessImg2(fileName);
						}
					}
				}
			}else{
				//需求
				if(file != null){
					UpLoadFile.delete(business.getBusinessImg1());
					String fileName = UpLoadFile.upload(file, fileFileName);
					business.setBusinessImg1(fileName);
				}
			}
			businessDao.updateBusiness(business);
			return "businessUpdate";
		}else if(commonType.equals("train")){
			if(train.getTrainType() == 1){
				//供应
				if(files != null && files.length > 0){
					for(int i=0;i<files.length;i++){
						String fileName = UpLoadFile.upload(files[i], filesFileName[i]);
						if(flags[i].equals("trainImg1")){
							UpLoadFile.delete(train.getTrainImg1());
							train.setTrainImg1(fileName);
						}else if(flags[i].equals("trainImg2")){
							UpLoadFile.delete(train.getTrainImg2());
							train.setTrainImg2(fileName);
						}
					}
				}
			}else{
				//需求
				if(file != null){
					String fileName = UpLoadFile.upload(file, fileFileName);
					UpLoadFile.delete(train.getTrainImg1());
					train.setTrainImg1(fileName);
				}
			}
			trainDao.updateTrain(train);
			return "trainUpdate";
		}else if(commonType.equals("vote")){
			trainVoteDao.updateVote(vote);
			return "voteUpdate";
		}else{
			return null;
		}
	}
	
	public String userUI(){
//		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getContext().get("request");
//		manageType = request.getParameter("manageType");
		user = (User) ServletActionContext.getContext().getSession().get("user");
		manageType = "updateInfo";
		return "userUI";
	}
	
	public String updateInfo(){
		userDao.updateUser(user);
		user = userDao.findUserById(user.getUserId());
		ServletActionContext.getContext().getSession().remove("user");
		ServletActionContext.getContext().getSession().put("user", user);
		return "updateInfo";
	}
	
	public String toUpdatePwd(){
		manageType = "updatePwd";
		return "toUpdatePwd";
	}
	
	public String toUpdateImage(){
		manageType = "updateImg";
		return "toUpdateImage";
	}
	
	public String updateImage() throws Exception {
		User user = (User) ServletActionContext.getContext().getSession().get("user");
		if(file != null){
			//删除之前的文件
			UpLoadFile.delete(user.getUserImg1());
			//上传文件
			String fileName = UpLoadFile.upload(file, fileFileName);
			//设置属性
			user.setUserImg1(fileName);
		}
		ServletActionContext.getContext().getSession().remove("user");
		ServletActionContext.getContext().getSession().put("user", user);
		return "updateImage";
	}
	
	public String updatePwd(){
		User user = (User) ServletActionContext.getContext().getSession().get("user");
		user.setPassword(newPassword);
		userDao.updatePwd(user);
		return "updatePwd";
	}
	
	public String isRight(){
		User user = (User) ServletActionContext.getContext().getSession().get("user");
		if(user.getPassword().equals(MD5Util.getMD5Code(password))){
			status = "true";
		}else{
			status = "false";
		}
		return "isRight";
	}
	
	public String isExist(){
		if(userDao.isExist(username)){
			status = "true";
		}else{
			status = "false";
		}
		return "isExist";
	}
	
	public String addUser(){
		user = new User();
		user.setPassword(password);
		user.setUsername(username);
		userDao.addUser(user);
		return "addUser";
	}
	
	public String checkLogin(){
		User user = userDao.checkLogin(username, password);
		if(user != null){
			ServletActionContext.getContext().getSession().put("user", user);
			return "loginSuccess";
		}else{
			info = "用户名或者密码有误！";
			return "loginFail";
		}
	}
	
	public String loginOut(){
		ServletActionContext.getContext().getSession().remove("user");
		return "loginOut";
	}
	
	public String toforgetPwdUI(){
		return "toforgetPwdUI";
	}
	
	public void findPwd() throws Exception{
		User user = userDao.findSingle("username", username);
		user.setPassword(newPassword);
		userDao.updatePwd(user);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script>alert('找回密码成功！');location.href='user_loginUI.action';</script>");
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
	public List<Business> getBusinessList() {
		return businessList;
	}
	public void setBusinessList(List<Business> businessList) {
		this.businessList = businessList;
	}
	public List<Vote> getVoteList() {
		return voteList;
	}
	public void setVoteList(List<Vote> voteList) {
		this.voteList = voteList;
	}
	public List<Train> getTrainList() {
		return trainList;
	}
	public void setTrainList(List<Train> trainList) {
		this.trainList = trainList;
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
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getManageType() {
		return manageType;
	}
	public void setManageType(String manageType) {
		this.manageType = manageType;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	public String loginUI(){
		return "loginUI";
	}
	public String registerUI(){
		return "registerUI";
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
	public List<Industry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<Industry> industryList) {
		this.industryList = industryList;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
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
