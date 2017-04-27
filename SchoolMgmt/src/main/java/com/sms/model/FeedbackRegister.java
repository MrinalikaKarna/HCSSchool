package com.sms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="feedbackregister")
public class FeedbackRegister {
	
	@Id
	@Column(name = "feedbackid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int feedbackid;
	
	@ManyToOne
    @JoinColumn(name="userid")
	private UserDetails userDetails;
	

	@Column(name = "feedbackcomments")
	private String feedbackcomments;
	
	@Column(name = "submitter")
	private String submitter;
	
	@Column(name = "submitdate")
	private String submitdate;

	public int getFeedbackid() {
		return feedbackid;
	}

	public void setFeedbackid(int feedbackid) {
		this.feedbackid = feedbackid;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public String getFeedbackcomments() {
		return feedbackcomments;
	}

	public void setFeedbackcomments(String feedbackcomments) {
		this.feedbackcomments = feedbackcomments;
	}

	public String getSubmitter() {
		return submitter;
	}

	public void setSubmitter(String submitter) {
		this.submitter = submitter;
	}

	public String getSubmitdate() {
		return submitdate;
	}

	public void setSubmitdate(String submitdate) {
		this.submitdate = submitdate;
	}
	
	

}
