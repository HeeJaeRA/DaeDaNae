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
	public int getTotalCnt(int rsCode) {
		return 0;
	}

}