package co.yedam.member.service;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	public String userId;
	public String userPw;
	public String userName;
	public String nickName;
	public Date birthDay;
	public String grade;
	public String phone;
	public String address;
	public int money;
	public String image;
	public String gender;

}
