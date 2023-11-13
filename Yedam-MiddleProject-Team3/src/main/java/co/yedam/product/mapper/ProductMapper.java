package co.yedam.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.product.service.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> selectList();
	public ProductVO select(@Param("id") String prodCode);
	
	public List<ProductVO> selectRlist();

}
