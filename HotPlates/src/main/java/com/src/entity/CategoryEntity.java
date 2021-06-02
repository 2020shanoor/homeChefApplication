package com.src.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class CategoryEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private int categoryId;

	@Column(name = "category_title")
	private String categoryTitle;

	@Column(name = "category_desc")
	private String categoryDesc;

	@OneToMany(mappedBy = "categoryEntity")
	private List<ProductEntity> products = new ArrayList<ProductEntity>();

	@Override
	public String toString() {
		return "CategoryEntity [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDesc="
				+ categoryDesc + ", products=" + products + "]";
	}

	public CategoryEntity(int categoryId, String categoryTitle, String categoryDesc, List<ProductEntity> products) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDesc = categoryDesc;
		this.products = products;
	}

	public CategoryEntity(String categoryTitle, String categoryDesc, List<ProductEntity> products) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDesc = categoryDesc;
		this.products = products;
	}

	
	public CategoryEntity() {
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}

	public List<ProductEntity> getProducts() {
		return products;
	}

	public void setProducts(List<ProductEntity> products) {
		this.products = products;
	}

	
}