package co.yedam.review.service;

import java.util.List;

public interface ReviewService {
	
	public List<ReviewVO> reviewList(String rsCode);
	
	public boolean addReview(ReviewVO vo);

	public int getTotalCnt(int rsCode);

}
