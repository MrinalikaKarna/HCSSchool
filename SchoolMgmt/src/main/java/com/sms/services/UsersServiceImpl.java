package com.sms.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.dao.UsersDao;
import com.sms.model.AttendanceDetails;
import com.sms.model.BlogPostStore;
import com.sms.model.ClassDetails;
import com.sms.model.ExamDetails;
import com.sms.model.FeedbackRegister;
import com.sms.model.Leaves;
import com.sms.model.MarksDetails;
import com.sms.model.NewsEvent;
import com.sms.model.UserDetails;
import com.sms.model.UsersModel;
import com.sms.model.VisualArtStore;
import com.sms.model.YearDetails;

@Service("usersServices")
public class UsersServiceImpl implements UsersServices {
	
	@Autowired
	UsersDao usersDao;

	public List<UsersModel> getUsersList() {
		return usersDao.getUsersList();
	}

	public boolean delete(UsersModel usersModel) {
		return usersDao.delete(usersModel);
	}

	public boolean SaveorUpdate(UsersModel usersModel) {
        return usersDao.SaveorUpdate(usersModel);
	}

	public UsersModel doLogin(UsersModel usersModel) {
		// TODO Auto-generated method stub
		return usersDao.doLogin(usersModel);
	}
	


	public UserDetails getUserDetails(long mobilenumber) {
		return usersDao.getUserDetails(mobilenumber);
	}

	public boolean saveUserLeaves(Leaves leaves) {
		return usersDao.saveUserLeaves(leaves);
	}

	public List<NewsEvent> getNewsEventList() {
		return usersDao.getNewsEventList();
	}

	public boolean saveNewsEvent(NewsEvent newsEvent) {
		return  usersDao.saveNewsEvent(newsEvent);
	}

	public List<ClassDetails> getClassDetailsList() {
		
		return usersDao.getClassDetailsList();
	}

	public boolean saveUserUpdateDetails(UserDetails userDetails) {
		return usersDao.saveUserUpdateDetails(userDetails);
	}

	public List<YearDetails> getYearDetailsList() {
		return usersDao.getYearDetailsList();
	}

	public List<ExamDetails> getExamDetailsList() {
		return usersDao.getExamDetailsList();
	}

	public boolean save(VisualArtStore uploadFile) {
		return usersDao.save(uploadFile);
		
	}

	public List<VisualArtStore> getVisualArtStoreList() {
		return usersDao.getVisualArtStoreList();
	}

	public List<byte[]> getAllImages() {
		return usersDao.getAllImages();
	}

	public List<BlogPostStore> getBlogPostStoreList() {
		return usersDao.getBlogPostStoreList();
	}

	public boolean save(BlogPostStore blogpostFile) {
		return usersDao.save(blogpostFile);
	}

	public List<UserDetails> getUserClassDetails(int classid) {
		return usersDao.getUserClassDetails(classid);
	}

	public boolean saveUserMarksUpdateDetails(MarksDetails marksDetails) {
		return usersDao.saveUserMarksUpdateDetails(marksDetails);
	}

	public MarksDetails getUsersMarksDetails(int userid, int classid, int examid) {
		return usersDao.getUsersMarksDetails(userid, classid, examid);
	}

	public boolean saveUserAttendaceUpdateDetails(AttendanceDetails attendanceDetails) {
		return usersDao.saveUserAttendaceUpdateDetails(attendanceDetails);
	}

	public boolean saveUserFeedbackDetails(FeedbackRegister feedbackRegister) {
		return usersDao.saveUserFeedbackDetails(feedbackRegister);
	}

	public List<FeedbackRegister> getFeedbackDetailsList(int userid) {
		return usersDao.getFeedbackDetailsList(userid);
	}

}
