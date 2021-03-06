package com.sms.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sms.model.AttendanceDetails;
import com.sms.model.BlogPostStore;
import com.sms.model.ClassDetails;
import com.sms.model.EventParticipants;
import com.sms.model.ExamDetails;
import com.sms.model.FeedbackRegister;
import com.sms.model.Leaves;
import com.sms.model.MarksDetails;
import com.sms.model.NewsEvent;
import com.sms.model.ResultParams;
import com.sms.model.UserDetails;
import com.sms.model.UsersModel;
import com.sms.model.VisualArtStore;
import com.sms.model.YearDetails;
import com.sms.services.UsersServiceImpl;
import com.sms.services.UsersServices;

@Controller
@RequestMapping(value="/users")
public class Users {
	
	@Autowired
	private UsersServices usersServices;
	
	@RequestMapping(value="/page", method=RequestMethod.GET)
	public ModelAndView getPage(){
		ModelAndView view = new ModelAndView("Hello");
		
		return view;
	}
	

	
	@RequestMapping(value="/welcome", method=RequestMethod.POST)
	public String loginUser(@ModelAttribute("userLoginData") UsersModel usersModel, ModelMap model, HttpSession newsession, RedirectAttributes redirectAttributes)
	{if(usersModel.getMobilenumber()!=0 && usersModel.getPassword()!=null)
	{ 
		UsersModel usersModelnew = usersServices.doLogin(usersModel);			
		if (usersModelnew!=null){
			newsession.setAttribute("UsersModel", usersModel);
			UserDetails userDetailsnew = usersServices.getUserDetails(usersModelnew.getMobilenumber());
			newsession.setAttribute("UserDetails", userDetailsnew);
			List<NewsEvent> newsevent = usersServices.getNewsEventList();
			newsession.setAttribute("NewsEventData", newsevent);
			return "redirect:Hello";
		}else{
			redirectAttributes.addFlashAttribute("Failed", "failed");
			return "redirect:/";
		}
	}else{
		return "redirect:/";
	}
	}
	
	
	
	@RequestMapping(value="/Hello", method=RequestMethod.GET)
	public String showWelcome(ModelMap model){
		model.put("Hello", new UsersModel());
		model.addAttribute("TabStatus","hello");
		model.addAttribute("MenuStatus","News");
		return "Hello";	
	}
	
	@RequestMapping(value="/marksdetails", method=RequestMethod.GET)
	public String showStudentDetails(ModelMap model){
		model.addAttribute("MarksDetails", new MarksDetails());
		return "marksdetails";	
	}
	
	@RequestMapping(value="/eventparticipants", method=RequestMethod.GET)
	public String showEventParticipantsDetails(ModelMap model){
		List<EventParticipants> eventParticipants = usersServices.getEventParticipantsList();
	    model.addAttribute("EventParticipantsList", eventParticipants);
	    List<String> eventTitle = usersServices.getEventTitleList();
	    model.addAttribute("EventTitleList", eventTitle);
		return "eventparticipants";	
	}
	
	@RequestMapping(value="/feedbacksheet", method=RequestMethod.GET)
	public String showFeedbackClass(ModelMap model){
		List<ClassDetails> classDetails1 = usersServices.getClassDetailsList();
	    model.addAttribute("ClassDetails", classDetails1);
	    model.addAttribute("ClassDetailsnew", new ClassDetails());
		return "feedbacksheet";
	}
	
	@RequestMapping(value="/attendancesheet", method=RequestMethod.GET)
	public String showAttendanceSheet(ModelMap model){
		List<ClassDetails> classDetails1 = usersServices.getClassDetailsList();
	    model.addAttribute("ClassDetails", classDetails1);
	    model.addAttribute("ClassDetailsnew", new ClassDetails());
		return "attendancesheet";	
	}
	
	@RequestMapping(value="/getStudentDetails",method=RequestMethod.POST)
	public String getStudentDetails(ModelMap model, @ModelAttribute("ClassDetailsnew") ClassDetails classdetails)
	{   
		int classid = classdetails.getClassid();
		List<UserDetails> studentMarksDetails = usersServices.getUserClassDetails(classid);
        model.addAttribute("StudentDetails", studentMarksDetails);
 
	    List<YearDetails> yearDetails = usersServices.getYearDetailsList();
	    model.addAttribute("YearDetails", yearDetails);
	    
	    List<ExamDetails> examDetails = usersServices.getExamDetailsList();
	    model.addAttribute("ExamDetails", examDetails);
	    
//	    model.addAttribute("MarksDetailsNew", new MarksDetails());
        
	    return "marksdetails";
			
		}
	
	@RequestMapping(value="/getStudentRegisterDetails",method=RequestMethod.POST)
	public String getStudentRegisterDetailsls(ModelMap model, @ModelAttribute("ClassDetailsnew") ClassDetails classdetails)
	{   
		int classid = classdetails.getClassid();
		List<UserDetails> studentMarksDetails = usersServices.getUserClassDetails(classid);
        model.addAttribute("StudentDetails", studentMarksDetails);
   
	    return "studentattendancedetails";
			
		}
	
	@RequestMapping(value="/getStudentFeedbackDetails",method=RequestMethod.POST)
	public String getStudentFeedbackDetailsls(ModelMap model, @ModelAttribute("ClassDetailsnew") ClassDetails classdetails)
	{   
		int classid = classdetails.getClassid();
		List<UserDetails> studentMarksDetails = usersServices.getUserClassDetails(classid);
        model.addAttribute("StudentDetails", studentMarksDetails);
   
	    return "studentfeedbackdetails";
			
		}
	
	@RequestMapping(value="/addparticipantdetails",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> addParticipantDetails(@RequestBody EventParticipants eventParticipants) 
	{   Map<String,Object> map = new HashMap<String,Object>(); 
	    eventParticipants.setApprovalstatus("Pending");
		boolean participantUpdateStatus = usersServices.addParticipantsDetails(eventParticipants);
		if (participantUpdateStatus==true){
			map.put("ParticipantUpdateStatus", participantUpdateStatus);
			map.put("message", "Your participation has been submitted..");

		}else{
			map.put("message", "Error submitting your participation");
	
		}
		return map;
       }
	
	@RequestMapping(value="/approveparticipation",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> approveParticipation(@RequestBody EventParticipants eventParticipants) 
	{   Map<String,Object> map = new HashMap<String,Object>(); 
		boolean approvalUpdateStatus = usersServices.approveParticipantsDetails(eventParticipants);
		if (approvalUpdateStatus==true){
			map.put("ParticipantUpdateStatus", approvalUpdateStatus);
			map.put("message", "Approved..");

		}else{
			map.put("message", "Error approving");
	
		}
		return map;
       }
       
	
	
	@RequestMapping(value="creativecorner/visualart", method=RequestMethod.GET)
	public String showVisualArt(ModelMap model){
		List<VisualArtStore> visualArtStore = usersServices.getVisualArtStoreList();
		model.put("VisualData", visualArtStore);
		int count = visualArtStore.size();
		List<String> imageList = new ArrayList<String>();
		for(int i=0;i<count;i++){
	         byte[] binaryData = visualArtStore.get(i).getFiledata();
	         if(binaryData != null){
	         try {
	                byte[] encodeBase64 = Base64.encodeBase64(binaryData);
	                String base64Encoded = new String(encodeBase64, "UTF-8");
//	                model.addAttribute("ImageList", base64Encoded);
	                imageList.add(base64Encoded);

	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	         }}
		 model.addAttribute("ImageList", imageList);
		return "visualart";
	}
	
	
	@RequestMapping(value="creativecorner/blogpost", method=RequestMethod.GET)
	public String showBlogpost(ModelMap model){
		model.addAttribute("BlogDetails", new BlogPostStore());
		List<BlogPostStore> blogPostStore = (List<BlogPostStore>) usersServices.getBlogPostStoreList();
		
		model.addAttribute("BlogPostDetail",blogPostStore);
		return "blogpost";
	}
	
	@RequestMapping(value="/leaves", method=RequestMethod.POST)
	public String applyLeaves(ModelMap model, @ModelAttribute("userLeaveData") Leaves leaves)
	{
    if(leaves.getFromdate()!=null && leaves.getReason()!=null && !leaves.getReason().isEmpty())
	{   
		leaves.setStatus("Pending");
		boolean leaveUpdateStatus = usersServices.saveUserLeaves(leaves);
		if (leaveUpdateStatus==true){
			model.addAttribute("Status", true);
			return "leavesandattendance";
		}else{
			model.addAttribute("Status", false);
			return "leavesandattendance";
			
		}
	}else if(leaves.getFromdate()== null && leaves.getTodate()== null && leaves.getReason().isEmpty()){
		return "leavesandattendance";
	}
	return "leavesandattendance";
	
	}
	
	
	@RequestMapping(value="/creativecorner", method=RequestMethod.GET)
	public String showCreativeCorner(ModelMap model){
		model.addAttribute("TabStatus","creativecorner");
		return "creativecorner";
		
		
	}
	
	@RequestMapping(value="/myprofile",method=RequestMethod.GET)
	public String showMyProfile(ModelMap model, @RequestParam("param1") long mnumber)
	{
		UserDetails usersModelDetail = (UserDetails)usersServices.getUserDetails(mnumber);
		//newsession.setAttribute("UsersModelDetail", usersModelDetail);
		model.addAttribute("UsersModelDetail",usersModelDetail);
		model.addAttribute("MenuStatus","myprofile");
         return "myprofile";
         }
	
	
	
	
	@RequestMapping(value="/reportcard",method=RequestMethod.GET)
	public String showMyReportCard(ModelMap model)
	{    List<ClassDetails> classDetails = usersServices.getClassDetailsList();
         model.addAttribute("ClassDetails", classDetails);
         List<ExamDetails> examDetails = usersServices.getExamDetailsList();
 	     model.addAttribute("ExamDetails", examDetails);
 	     model.addAttribute("MenuStatus","reportcard");
         return "reportcard";
         }
	
	
	@RequestMapping(value="/getResultDetails",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getResultDetails(@RequestBody ResultParams resultparams) 
	{   Map<String,Object> map = new HashMap<String,Object>(); 
	    int userid = resultparams.getUserid();
	    int classid = resultparams.getClassid();
	    int examid = resultparams.getExamid();
		MarksDetails marksDetails = usersServices.getUsersMarksDetails(userid,classid,examid);
		if (marksDetails!=null){
			map.put("MarksDetails", marksDetails);
			map.put("message", "Got Data");

		}else{
			map.put("message", "No Data");
	
		}
		return map;
       }
	
	@RequestMapping(value="/studentadmin",method=RequestMethod.GET)
	public String showStudentAdmin(ModelMap model)
	{    model.put("newsEventData", new NewsEvent());
	     model.addAttribute("MenuStatus","StudentAdmin");
         return "studentadmin";
         }
	
	@RequestMapping(value="/teacheradmin",method=RequestMethod.GET)
	public String showTeacherAdmin(ModelMap model)
	{    model.addAttribute("MenuStatus","TeacherAdmin");
         return "teacheradmin";
         }
	
	@RequestMapping(value="/supportadmin",method=RequestMethod.GET)
	public String showSupportAdmin(ModelMap model)
	{    model.addAttribute("MenuStatus","SupportAdmin");
         return "supportadmin";
         }
	
	@RequestMapping(value="/adduserdetails",method=RequestMethod.GET)
	public String addUserDetails(ModelMap model)
	{   
		List<ClassDetails> classDetails = usersServices.getClassDetailsList();
	    model.addAttribute("ClassDetails", classDetails);
		model.addAttribute("AddUserData", new UserDetails());
		return "adduserdetails";
         }
	
	@RequestMapping(value="/uploadmarks",method=RequestMethod.GET)
	public String uploadMarksDetails(ModelMap model)
	{   
		List<ClassDetails> classDetails1 = usersServices.getClassDetailsList();
	    model.addAttribute("ClassDetails", classDetails1);

	    
		model.addAttribute("ClassDetailsnew", new ClassDetails());
		return "uploadmarks";
         }
	
	
	@RequestMapping(value="/adduserdetails",method=RequestMethod.POST)
	public String addUserDetailsPost(ModelMap model, @ModelAttribute("AddUserData") UserDetails userDetails)
	{   

		boolean userUpdateStatus = usersServices.saveUserUpdateDetails(userDetails);
		if (userUpdateStatus==true){
			model.addAttribute("UserUpdateStatus", true);
			return "adduserdetails";
		}else{
			model.addAttribute("UserUpdateStatus", false);
			return "adduserdetails";
			
		}
         }
	
	
	@RequestMapping(value="/addmarksdetails",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> addMarksDetails(@RequestBody MarksDetails marksDetails)
	{   
		Map<String,Object> map = new HashMap<String,Object>();
		boolean marksUpdateStatus = usersServices.saveUserMarksUpdateDetails(marksDetails);
		if (marksUpdateStatus==true){
			map.put("MarksUpdateStatus", true);
			map.put("message", "Saved successfully");

		}else{
			map.put("MarksUpdateStatus", true);
			map.put("message", "Not Saved successfully");

		}
		return map;
      }
	
	@RequestMapping(value="/addattendancedetails",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> addAttendanceDetails(@RequestBody AttendanceDetails attendanceDetails)
	{   
		Map<String,Object> map = new HashMap<String,Object>();
		if (!attendanceDetails.getDate().isEmpty()){
		boolean attendanceUpdateStatus = usersServices.saveUserAttendaceUpdateDetails(attendanceDetails);
		if (attendanceUpdateStatus==true){
			map.put("AttendanceUpdateStatus", true);
			map.put("message", "Saved successfully");
			map.put("NullMessage", "ok");
		}else{
			map.put("AttendanceUpdateStatus", false);
			map.put("message", "Not Saved successfully");
			map.put("NullMessage", "ok");

		} 
		}else{
			map.put("NullMessage", "Enter Date First..");
		}
		return map;
      }
	
	@RequestMapping(value="/addfeedbackdetails",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> addFeedbackDetails(@RequestBody FeedbackRegister feedbackRegister)
	{   
		Map<String,Object> map = new HashMap<String,Object>();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		feedbackRegister.setSubmitdate(dateFormat.format(date));
		if (!feedbackRegister.getFeedbackcomments().isEmpty()){
		boolean feedbackUpdateStatus = usersServices.saveUserFeedbackDetails(feedbackRegister);
		if (feedbackUpdateStatus==true){
			map.put("FeedbackUpdateStatus", true);
			map.put("message", "Saved successfully");
			map.put("NullMessage", "ok");
		}else{
			map.put("FeedbackUpdateStatus", false);
			map.put("message", "Not Saved successfully");
			map.put("NullMessage", "ok");

		} 
		}else{
			map.put("NullMessage", "Enter Comments First..");
		}
		return map;
      }
	
	
	
	
	@RequestMapping(value="/leavesandattendance",method=RequestMethod.GET)
	public String showLeaves(ModelMap model, @RequestParam("param3") int userid)
	{   
		model.addAttribute("userId", userid);
		model.addAttribute("userLeaveData", new Leaves());
		model.addAttribute("MenuStatus","Leaves");
        return "leavesandattendance";
         }
	
	@RequestMapping(value="/attendancetracker",method=RequestMethod.GET)
	public String showAttendanceTracker(ModelMap model)
	{   
		model.addAttribute("MenuStatus","Leaves");
        return "attendancetracker";
         }
	
	@RequestMapping(value="/teachersfeedback",method=RequestMethod.GET)
	public String showTeachersFeedback(ModelMap model, @RequestParam("param3") int userid, HttpSession newsession )
	{   
	
		model.addAttribute("userId", userid);
		List<FeedbackRegister> feedbackDetails = usersServices.getFeedbackDetailsList(userid);
		model.addAttribute("MenuStatus","TeachersFeedback");
		model.addAttribute("Feedback", feedbackDetails);
        return "teachersfeedback";
         
	}
	 

	
	@RequestMapping(value="creativecorner/visualart/doSubmitBlogpost", method=RequestMethod.POST)
	public String submitBlogPost(ModelMap model, @ModelAttribute("BlogDetails") BlogPostStore blogpostFile)
	{
    if(!blogpostFile.getBlogtitle().isEmpty() && !blogpostFile.getBlogbody().isEmpty())
	{   
		boolean blogpostUpdateStatus = usersServices.save(blogpostFile);
		if (blogpostUpdateStatus==true){
			model.addAttribute("Status", true);
			return "blogpost";
		}else{
			model.addAttribute("Status", false);
			return "blogpost";
			
		}
	}else {
		return "blogpost";
	}
	}
	
	@RequestMapping(value="submitNewsData", method=RequestMethod.POST)
	public String submitNewsData(ModelMap model, @ModelAttribute("newsEventData") NewsEvent newsEvent)
	{
    if(!newsEvent.getTitle().isEmpty() && !newsEvent.getContent().isEmpty())
	{   
		newsEvent.setCategory("News");
		boolean newsEventUpdateStatus = usersServices.saveNewsEvent(newsEvent);
		if (newsEventUpdateStatus==true){
			model.addAttribute("NewsEventStatus", true);
			return "studentadmin";
		}else{
			model.addAttribute("NewsEventStatusStatus", false);
			return "studentadmin";			
		}
	}
	return "studentadmin";
	
	}
	
	@RequestMapping(value="submitEventData", method=RequestMethod.POST)
	public String submitEventData(ModelMap model, @ModelAttribute("newsEventData") NewsEvent newsEvent)
	{
    if(!newsEvent.getTitle().isEmpty() && !newsEvent.getContent().isEmpty())
	{   
		newsEvent.setCategory("Event");
		boolean newsEventUpdateStatus = usersServices.saveNewsEvent(newsEvent);
		if (newsEventUpdateStatus==true){
			model.addAttribute("NewsEventStatus", true);
			return "studentadmin";
		}else{
			model.addAttribute("NewsEventStatusStatus", false);
			return "studentadmin";			
		}
	}
	return "studentadmin";
	
	}
	
	@RequestMapping(value="submitAnnouncementData", method=RequestMethod.POST)
	public String submitAnnouncementData(ModelMap model, @ModelAttribute("newsEventData") NewsEvent newsEvent)
	{
    if(!newsEvent.getTitle().isEmpty() && !newsEvent.getContent().isEmpty())
	{   
		newsEvent.setCategory("Announcement");
		boolean newsEventUpdateStatus = usersServices.saveNewsEvent(newsEvent);
		if (newsEventUpdateStatus==true){
			model.addAttribute("NewsEventStatus", true);
			return "studentadmin";
		}else{
			model.addAttribute("NewsEventStatusStatus", false);
			return "studentadmin";			
		}
	}
	return "studentadmin";
	
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String showLogout(ModelMap model, HttpSession newsession) {
		newsession.removeAttribute("UsersModel");
		newsession.invalidate();
		return "redirect:/";
	}

	

    @RequestMapping(value = "creativecorner/visualart/doUpload", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam int userid, @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {
      
      if (fileUpload != null && fileUpload.length > 0) {
        for (CommonsMultipartFile aFile : fileUpload){
             
            VisualArtStore uploadFile = new VisualArtStore();
            UserDetails userDetails = new UserDetails();
            userDetails.setUserid(userid);
            uploadFile.setUserDetails(userDetails);
            uploadFile.setFilename(aFile.getOriginalFilename());
            uploadFile.setFiledata(aFile.getBytes());
            boolean fileUploadStatus = usersServices.save(uploadFile);
            if (fileUploadStatus==true){
    			
    			return "visualart";
    		}else{
    			
    			return "visualart";			
    		}}}
        return "visualart";
    }
    
    
 
    
    


}   



