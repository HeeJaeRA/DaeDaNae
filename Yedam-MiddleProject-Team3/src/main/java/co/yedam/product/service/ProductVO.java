package co.yedam.product.service;

import lombok.Data;

@Data
public class ProductVO {
	
	private String prodCode;
	private String prodName;
	private String prodDesc;
	private double price;
	private double offPrice;
	private int likeIt;
	private String prodImage;

}
