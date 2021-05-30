package com.src.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.src.entity.CategoryEntity;
import com.src.entity.ProductEntity;

public class ProductDAO {
	private SessionFactory factory;

	public ProductDAO(SessionFactory factory) {
		this.factory = factory;
	}

	// Save to DB
	public int saveProduct(ProductEntity productEnt) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int prodId = (Integer) session.save(productEnt);
		tx.commit();
		session.close();
		return prodId;
	}

	// To get the Category List in Dropdown for New product entry.
	public List<ProductEntity> getProduct() {
		Session listSession = this.factory.openSession();
		Query listQuery = listSession.createQuery("from ProductEntity");
		List<ProductEntity> list = listQuery.list();
		return list;
	}
}
