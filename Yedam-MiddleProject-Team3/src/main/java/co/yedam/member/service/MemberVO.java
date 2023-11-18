package co.yedam.member.service;

import lombok.Data;

@Data
public class MemberVO {
	public String userId;
	public String userPw;
	public String userName;
	public String nickName;
	public String birthDay;// string으로 바꿔서 sql은 데이트 형식으로 들어가는 법?
	public String grade;
	public String phone;
	public String address;
	public int money;
	public String image;
	public String gender;
	public String couponCode;
	public String couponType;
	
}
