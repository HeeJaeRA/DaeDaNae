package co.yedam.review.service;

import java.util.List;

public interface ReviewService {
	
	public List<ReviewVO> reviewList(String rsCode);
	
	public boolean addReview(ReviewVO vo);
	
	public boolean delReview(int reviewNo);
	
	public boolean likeReview(int reviewNo);
	
	public ReviewVO cntStar(String rsCode);
	
	public boolean updateMoney(String id);
	
	public ReviewVO checkReview(String rsCode, String uid);

}
