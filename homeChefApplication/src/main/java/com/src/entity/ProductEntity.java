package com.src.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ProductEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int productId;

	@Column(name = "product_name")
	private String productName;

	@Column(name = "product_desc")
	private String productDesc;

	@Column(name = "product_photo")
	private String productPhoto;

	@Column(name = "product_price")
	private int productPrice;

	@Column(name = "product_discount")
	private int productDiscount;

	@Column(name = "product_quantity")
	private int productQuantity;

	@ManyToOne
	private CategoryEntity categoryEntity;

	@Override
	public String toString() {
		return "ProductEntity [productId=" + productId + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", productPhoto=" + productPhoto + ", productPrice=" + productPrice + ", productDiscount="
				+ productDiscount + ", productQuantity=" + productQuantity + ", categoryEntity=" + categoryEntity + "]";
	}

	public ProductEntity(int productId, String productName, String productDesc, String productPhoto, int productPrice,
			int productDiscount, int productQuantity, CategoryEntity categoryEntity) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.categoryEntity = categoryEntity;
	}

	public ProductEntity(String productName, String productDesc, String productPhoto, int productPrice,
			int productDiscount, int productQuantity, CategoryEntity categoryEntity) {
		super();
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.categoryEntity = categoryEntity;
	}

	public ProductEntity() {
		super();
	}

	/**
	 * Calculate Price after discount
	 * 
	 * @return
	 */

	public int getPriceAfterApplyingDiscount() {
		int discount = (int) ((this.getProductDiscount() / 100.0) * this.getProductPrice());
		return this.getProductPrice() - discount;

	}

	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

}