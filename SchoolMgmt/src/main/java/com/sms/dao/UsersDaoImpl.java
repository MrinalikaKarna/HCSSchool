package com.sms.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
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

@Repository
@Transactional
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SessionFactory session;

	private UsersModel usersModelDetail;

	private UserDetails userDetails;

	public void setSession(SessionFactory session) {
		this.session = session;
	}

	public List<UsersModel> getUsersList() {
		return session.getCurrentSession().createQuery("from users").list();

	}

	public List<NewsEvent> getNewsEventList() {

		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.NewsEvent";
		Query query = session1.createQuery(hql);
		List<NewsEvent> newsEvent = (List<NewsEvent>) query.list();
		List<NewsEvent> newsEvents = Lists.reverse(newsEvent);
//		Iterator<NewsEvent> iterator = newsEvents.iterator();
//		NewsEvent ne = (NewsEvent) iterator.next();
//		Date fromdate = ne.getFromdate();
//		Date todate = ne.getTodate();
//		SimpleDateFormat Format = new SimpleDateFormat("dd-MM-yyyy");
//		String dateBufferString1 = Format.format(fromdate);
//		String dateBufferString2 = Format.format(todate);
		
		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return newsEvents;

	}

	public boolean delete(UsersModel usersModel) {
		try {
			session.getCurrentSession().delete(usersModel);
		} catch (HibernateException e) {
			return false;
		}

		return true;
	}

	public boolean SaveorUpdate(UsersModel usersModel) {
		session.getCurrentSession().saveOrUpdate(usersModel);
		return true;
	}

	public UsersModel doLogin(UsersModel usersModel) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.UsersModel as u where u.mobilenumber=? and u.password=?";
		try {
			Query query = session1.createQuery(hql);
			query.setParameter(0, usersModel.getMobilenumber());
			query.setParameter(1, usersModel.getPassword());
			usersModel = (UsersModel) query.uniqueResult();
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return usersModel;
	}

	public UserDetails getUserDetails(long mobilenumber) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.UserDetails as u where u.userModel.mobilenumber=?";
		try {
			Query query = session1.createQuery(hql);
			query.setParameter(0, mobilenumber);
			userDetails = (UserDetails) query.uniqueResult();
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return userDetails;
	}

	public boolean saveUserLeaves(Leaves leaves) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			session1.save(leaves);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}

	}
	
	public boolean saveNewsEvent(NewsEvent newsEvent) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			session1.save(newsEvent);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}

	}

	@SuppressWarnings("unchecked")
	public List<ClassDetails> getClassDetailsList() {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.ClassDetails";
		Query query = session1.createQuery(hql);
		List<ClassDetails> classDetails = (List<ClassDetails>) query.list();
		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return classDetails;
		
	}

	public boolean saveUserUpdateDetails(UserDetails userDetails) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			
			session1.save(userDetails);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public List<YearDetails> getYearDetailsList() {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.YearDetails";
		Query query = session1.createQuery(hql);
		List<YearDetails> yearDetails = (List<YearDetails>) query.list();
		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return yearDetails;
	}

	@SuppressWarnings("unchecked")
	public List<ExamDetails> getExamDetailsList() {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.ExamDetails";
		Query query = session1.createQuery(hql);
		List<ExamDetails> examDetails = (List<ExamDetails>) query.list();
		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return examDetails;
	}

	@Transactional
	public boolean save(VisualArtStore uploadFile) {
		
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			session1.save(uploadFile);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}
	    
	
	}

	@SuppressWarnings("unchecked")
	public List<VisualArtStore> getVisualArtStoreList() {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.VisualArtStore";
		Query query = session1.createQuery(hql);
		List<VisualArtStore> visualArtStoreData = (List<VisualArtStore>) query.list();
		List<VisualArtStore> visualArtStoreDatas = Lists.reverse(visualArtStoreData);

		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return visualArtStoreDatas;
	}

	@SuppressWarnings("unchecked")
	public List<byte[]> getAllImages() {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "filedata from com.sms.model.VisualArtStore";
		Query query = session1.createQuery(hql);
		List<byte[]> imageData = (List<byte[]>) query.list();
		List<byte[]> imageDatas = Lists.reverse(imageData);

		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return imageDatas;
	}

	@SuppressWarnings("unchecked")
	public List<BlogPostStore> getBlogPostStoreList() {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.BlogPostStore";
		Query query = session1.createQuery(hql);
		List<BlogPostStore> blogPostStoreData = (List<BlogPostStore>) query.list();
		List<BlogPostStore> blogPostStoreDatas = Lists.reverse(blogPostStoreData);

		try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return blogPostStoreDatas;
	}

	public boolean save(BlogPostStore blogpostFile) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			session1.save(blogpostFile);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public List<UserDetails> getUserClassDetails(int classid) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.UserDetails as u where u.classDetails.classid=?";
         Query query = session1.createQuery(hql);
			query.setParameter(0, classid);
			List<UserDetails> userClassDetails = (List<UserDetails>) query.list();
	    try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return userClassDetails;
	}

	public boolean saveUserMarksUpdateDetails(MarksDetails marksDetails) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			session1.save(marksDetails);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}
	}

	public MarksDetails getUsersMarksDetails(int userid, int classid, int examid) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.MarksDetails as u where u.userDetails.userid=? and u.classDetails.classid=? and u.examDetails.examid=?";
		
			Query query = session1.createQuery(hql);
			query.setParameter(0, userid);
			query.setParameter(1, classid);
			query.setParameter(2, examid);
			MarksDetails marksDetails = (MarksDetails) query.uniqueResult();
	   try {
		    tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return marksDetails;
	}

	public boolean saveUserAttendaceUpdateDetails(AttendanceDetails attendanceDetails) {
		
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		UserDetails userDetails = attendanceDetails.getUserDetails();
		int userid = userDetails.getUserid();
		String date = attendanceDetails.getDate();
		
		String hql = "from com.sms.model.AttendanceDetails as a where a.userDetails.userid=? and a.date=?";
		Query query = session1.createQuery(hql);
		query.setParameter(0, userid);
		query.setParameter(1, date);
		AttendanceDetails attDetails = (AttendanceDetails) query.uniqueResult();
		if (attDetails == null){
		try {
			session1.save(attendanceDetails);
			tx.commit();
			session1.close();
			return true;}
		 catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}
		}
		return true; //this has to be corrected later.. Not correct code.. wrong logic
	}

	public boolean saveUserFeedbackDetails(FeedbackRegister feedbackRegister) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		try {
			session1.save(feedbackRegister);
			tx.commit();
			session1.close();
			return true;
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public List<FeedbackRegister> getFeedbackDetailsList(int userid) {
		Session session1 = session.openSession();
		Transaction tx = session1.beginTransaction();
		String hql = "from com.sms.model.FeedbackRegister as u where u.userDetails.userid=?";
         Query query = session1.createQuery(hql);
			query.setParameter(0, userid);
			List<FeedbackRegister> userFeedbackDetail = (List<FeedbackRegister>) query.list();
			List<FeedbackRegister> userFeedbackDetails = Lists.reverse(userFeedbackDetail);
	    try {
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return userFeedbackDetails;
	}

}
