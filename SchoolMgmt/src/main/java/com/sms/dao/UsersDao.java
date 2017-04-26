package com.sms.dao;

import java.util.List;

import com.sms.model.AttendanceDetails;
import com.sms.model.BlogPostStore;
import com.sms.model.ClassDetails;
import com.sms.model.ExamDetails;
import com.sms.model.Leaves;
import com.sms.model.MarksDetails;
import com.sms.model.NewsEvent;
import com.sms.model.UserDetails;
import com.sms.model.UsersModel;
import com.sms.model.VisualArtStore;
import com.sms.model.YearDetails;

public interface UsersDao {
	
	public List<UsersModel> getUsersList();
	public List<ClassDetails> getClassDetailsList();
	public List<YearDetails> getYearDetailsList();
	public List<ExamDetails> getExamDetailsList();
	public List<NewsEvent> getNewsEventList();
	public List<VisualArtStore> getVisualArtStoreList();
	public List<BlogPostStore> getBlogPostStoreList();
	public List<byte[]> getAllImages();
	public List<UserDetails> getUserClassDetails(int classid);
	public boolean delete(UsersModel usersModel);
	public boolean SaveorUpdate(UsersModel usersModel);
	public UsersModel doLogin(UsersModel usersModel);
	public UserDetails getUserDetails(long mobilenumber);
	public boolean saveUserLeaves(Leaves leaves);
	public boolean saveNewsEvent(NewsEvent newsEvent);
	public boolean saveUserUpdateDetails(UserDetails userDetails);
	public boolean save(VisualArtStore uploadFile);
	public boolean save(BlogPostStore blogpostFile);
	public boolean saveUserMarksUpdateDetails(MarksDetails marksDetails);
	public MarksDetails getUsersMarksDetails(int userid, int classid, int examid);
	public boolean saveUserAttendaceUpdateDetails(AttendanceDetails attendanceDetails);
	
	

}
