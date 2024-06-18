package com.exam.dto;

import javax.validation.constraints.NotBlank;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
	
	@NotBlank(message = "적어도 한글자 이상")
	String userId;
	@NotBlank(message = "적어도 한글자 이상")
	String userName;
	@NotBlank(message = "적어도 한글자 이상")
	String userPw;
	String phone1;
	String phone2;
	String phone3;
	String email1;
	String email2;
	String post;
	String addr1;
	
	public MemberDTO() {}

	public MemberDTO(@NotBlank(message = "적어도 한글자 이상") String userId, @NotBlank(message = "적어도 한글자 이상") String userName,
			@NotBlank(message = "적어도 한글자 이상") String userPw, String phone1, String phone2, String phone3, String email1, String email2, String post,
			String addr1) {
		this.userId = userId;
		this.userName = userName;
		this.userPw = userPw;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email1 = email1;
		this.email2 = email2;
		this.post = post;
		this.addr1 = addr1;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAdd() {
		return addr1;
	}

	public void setAdd(String addr1) {
		this.addr1 = addr1;
	}

	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userName=" + userName + ", userPw=" + userPw + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", email1=" + email1 + ", email2=" + email2 + ", post="
				+ post + ", addr1=" + addr1 + "]";
	}
	
}
