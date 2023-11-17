package co.yedam.reply.service;

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO {

	private int boardCode;
	private int replyCode;
	private String userId;
	private Date writeDate;
	private String replyContent;
	private int likeCnt;

}
