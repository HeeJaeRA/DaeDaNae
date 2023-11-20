package co.yedam.board.service;

import java.util.Date;

import lombok.Data;

@Data 
public class BoardVO {
	
	private int boardCode;
	private String boardCategory;
	private String boardTitle;
	private String userId;
	private Date writeDate;
	private Date updateDate;
	private String boardContent;
	private int boardView;
	private int likecnt;
	private String image1;
	private String image2;
	private String image3;
	
}
