package co.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.review.service.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> selectList(@Param("rsCode") String rsCode);
	
	public int insertReview(ReviewVO vo);
	
	public int deleteReview(int reviewNo);
	
	public int likeReview(int reviewNo);
	
	public ReviewVO cntStar(@Param("rsCode") String rsCode);

	public boolean updateMoney(String id);
	
	public List<ReviewVO> checkReview(@Param("rsCode") String rsCode, @Param("uid") String uid);

}
