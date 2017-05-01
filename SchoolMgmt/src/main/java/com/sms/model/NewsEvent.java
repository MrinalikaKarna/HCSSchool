package com.sms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="news_announcement_event")
public class NewsEvent {
	
	@Id
	@Column(name = "newsid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int newsid;

    
    @NotNull
	@Column(name = "title")
	private String title;
    
    @NotNull
	@Column(name = "content")
	private String content;
    
    @Column(name = "fromdate")
    @Temporal(TemporalType.DATE)
	private Date fromdate;
    
	@Column(name = "todate")
	@Temporal(TemporalType.DATE)
	private Date todate;
	
    
	@Column(name = "eligibility")
	private String eligibility;
    
    @NotEmpty
   	@Column(name = "category")
   	private String category;
    
    @ManyToOne
    @JoinColumn(name="userid")   
	private UserDetails userDetails;
    
//    @NotNull
//	@Column(name = "userid")
//	private int userid;
    
    
    
    

	public int getNewsid() {
		return newsid;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public void setNewsid(int newsid) {
		this.newsid = newsid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getFromdate() {
		return fromdate;
	}

	public void setFromdate(Date fromdate) {
		this.fromdate = fromdate;
	}

	public Date getTodate() {
		return todate;
	}

	public void setTodate(Date todate) {
		this.todate = todate;
	}

	public String getEligibility() {
		return eligibility;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}


	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
    
    

}
