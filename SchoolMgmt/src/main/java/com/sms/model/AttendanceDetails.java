package com.sms.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@Entity
@Table(name="attendanceregister")
public class AttendanceDetails  {


	@Id
	@Column(name = "attendanceid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int attendanceid;
	
	@ManyToOne
    @JoinColumn(name="userid")
	private UserDetails userDetails;
	
//	@JsonSerialize(using=JsonDateSerializer.class)
	@Column(name = "date")
	private String date;
	
	@Column(name = "attendancestatus")
	private String attendancestatus;

	public int getAttendanceid() {
		return attendanceid;
	}

	public void setAttendanceid(int attendanceid) {
		this.attendanceid = attendanceid;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}
    
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}

	public String getAttendancestatus() {
		return attendancestatus;
	}

	public void setAttendancestatus(String attendancestatus) {
		this.attendancestatus = attendancestatus;
	}
	
	

}
