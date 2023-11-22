package co.yedam.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.review.mapper.ReviewMapper;
import co.yedam.review.service.ReviewService;
import co.yedam.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	
	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true);
	
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);

	@Override
	public List<ReviewVO> reviewList(String rsCode) {
		return mapper.selectList(rsCode);
	}

	@Override
	public boolean addReview(ReviewVO vo) {
		return (mapper.insertReview(vo) == 1);
	}
	
	@Override
	public boolean delReview(int reviewNo) {
		return (mapper.deleteReview(reviewNo) == 1);
	}
	
	@Override
	public boolean likeReview(int reviewNo) {
		return (mapper.likeReview(reviewNo) == 1);
	}
	
	@Override
	public ReviewVO cntStar(String rsCode) {
		return mapper.cntStar(rsCode);
	}
	
	@Override
	public boolean updateMoney(String id) {
		return mapper.updateMoney(id);
	}
	
	@Override
	public List<ReviewVO> checkReview(String rsCode, String uid) {
		return mapper.checkReview(rsCode, uid);
	}

}
