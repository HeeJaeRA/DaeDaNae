package co.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.review.service.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> selectList(@Param("rsCode") String rsCode);
	
	public int insertReview(ReviewVO vo);
	
	public int getTotalCnt(String rsCode);

}
