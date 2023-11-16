package co.yedam.coupon.serviceImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.coupon.mapper.CouponMapper;
import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.service.CouponVO;


public class CouponServiceImpl implements CouponService {
	
	private SqlSession session = DataSourceMybatis.getInstance().openSession(true);
	private CouponMapper mapper = session.getMapper(CouponMapper.class);
	@Override
	public List<CouponVO> getCoupon() {
		return mapper.getCoupon();
	}
	@Override
	public boolean addCoupon(CouponVO vo) {
		return false;
	}
	@Override
	public CouponVO delCoupon(@Param("id")String id, @Param("cc")String cc) {
		return mapper.deleteCoupon(id, cc);
	}

	
}

