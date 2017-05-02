package com.sms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="eventparticipants")
public class EventParticipants {
	
	@Id
	@Column(name = "participantid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int participantid;
	
	@ManyToOne
    @JoinColumn(name="userid")
	private UserDetails userDetails;
	
	@ManyToOne
    @JoinColumn(name="newsid")
	private NewsEvent newsEvent;
	
	@Column(name = "approvalstatus")
	private String approvalstatus;

	public int getParticipantid() {
		return participantid;
	}

	public void setParticipantid(int participantid) {
		this.participantid = participantid;
	}

   

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public NewsEvent getNewsEvent() {
		return newsEvent;
	}

	public void setNewsEvent(NewsEvent newsEvent) {
		this.newsEvent = newsEvent;
	}

	public String getApprovalstatus() {
		return approvalstatus;
	}

	public void setApprovalstatus(String approvalstatus) {
		this.approvalstatus = approvalstatus;
	}
	
	

}
