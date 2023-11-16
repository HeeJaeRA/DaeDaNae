package co.yedam.review.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int reviewCode;
	private String rsCode;
	private String userId;
	private String nickname;
	private Date writeDate;
	private String writeContent;
	private int likecnt;
	private int starTaste;
	private int starPrice;
	private int starService;
	
	private int star;

}
