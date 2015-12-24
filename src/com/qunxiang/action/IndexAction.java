package com.qunxiang.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.qunxiang.bean.Business;
import com.qunxiang.bean.Data;
import com.qunxiang.bean.Department;
import com.qunxiang.bean.Industry;
import com.qunxiang.bean.Train;
import com.qunxiang.bean.Vote;
import com.qunxiang.dao.BusinessDao;
import com.qunxiang.dao.DataDao;
import com.qunxiang.dao.DepartmentDao;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.TrainDao;
import com.qunxiang.dao.TrainVoteDao;
import com.qunxiang.util.JsonDateValueProcessor;

@Controller
@Scope("prototype")
public class IndexAction {
	
	@Autowired
	private IndustryDao industryDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private TrainVoteDao trainVoteDao;
	@Autowired
	private BusinessDao businessDao;
	
	@Autowired
	private DataDao dataDao;
	
	private List<Business> businessList;
	private List<Vote> voteList;
	private List<Train> trainList;
	private List<Data> logoList;
	private List<Industry> industryList;
	private List<Department> departmentList;
	private String keyword;
	private String searchType;
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
	
	public void ajaxLoadIndustry() throws IOException{
		industryList=industryDao.findAll();
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		JSONArray array = JSONArray.fromObject(industryList,config);
		ServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(array);
	}
	
	public void ajaxLoadBusiness() throws Exception{
		//此处查供应,并且按照关注次数排序
		businessList = businessDao.findBusinessByPageSize(1, "businessFocusCount", 5);
		JSONArray array = JSONArray.fromObject(businessList);
		ServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(array);
	}
	
	public void searchUI() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
//		response.setContentType("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		String url = "";
		if(searchType.equals("business")){
			//业务能人
			Business business =  businessDao.findByKeyword(keyword);
			if(business != null){
				url = "business_businessIn.action?businessId="+business.getBusinessId();
			}
		}else if(searchType.equals("train")){
			//培训机构
			Train train = trainDao.findByKeyword(keyword);
			if(train != null){
				url = "trainChoose_trainChooseIn.action?trainId="+train.getTrainId();
			}
		}else if(searchType.equals("vote")){
			//培训投票
			Vote vote = trainVoteDao.findByKeyword(keyword);
			if(vote != null){
				url = "trainVote_trainVoteIn.action?voteId="+vote.getVoteId();
			}
		}else{
			//全部
			Business business =  businessDao.findByKeyword(keyword);
			if(business != null){
				url = "business_businessIn.action?businessId="+business.getBusinessId();
			}
			Train train = trainDao.findByKeyword(keyword);
			if(train != null){
				url = "trainChoose_trainChooseIn.action?trainId="+train.getTrainId();
			}
			Vote vote = trainVoteDao.findByKeyword(keyword);
			if(vote != null){
				url = "trainVote_trainVoteIn.action?voteId="+vote.getVoteId();
			}
		}
		if(url.equals("")){
			url = "index_toNoResultPage.action?keyword="+keyword;
		}
		pw.print("<script type='text/javascript'>location.href='"+url+"'</script>");//此处注意：要加单引号
//		pw.print("<script type='text/javascript'>alert(123);location.href='index_toNoResultPage.action?keyword=ganzi';</script>");
	}
	
	public String toNoResultPage() throws Exception{
		keyword = new String(keyword.getBytes("iso-8859-1"),"utf-8");
		return "toNoResultPage";
	}

	//首页
	public String indexUI(){
		//加载前10条业务能人信息
		businessList=businessDao.findBusinessByPageSize(1, "businessFocusCount", 10);
		//加载前10条培训课程信息
		voteList=trainVoteDao.findVoteByPageSize(2, "voteFocusCount", 10);
		//加载前10条培训投票信息
		trainList=trainDao.findTrainByPageSize(1, "trainFocusCount", 10);
		
		//滚动图
		logoList = dataDao.findByValue("首页滚动图");
		return "indexUI";
	}
	
	//发布信息页面
	public String releaseUI(){
		
		return "releaseUI";
	}
	//上传业务能人
	public String userUploadUI(){
		industryList = industryDao.getAll();
		departmentList = departmentDao.getAll();
		return "userUploadUI";
	}
	
	//上传培训机构
	public String trainUploadUI(){
		industryList = industryDao.getAll();
		return "trainUploadUI";
	}
	
	//上传培训投票
	public String voteUploadUI(){
		industryList = industryDao.getAll();
		return "voteUploadUI";
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public List<Data> getLogoList() {
		return logoList;
	}

	public void setLogoList(List<Data> logoList) {
		this.logoList = logoList;
	}
	
	
}
