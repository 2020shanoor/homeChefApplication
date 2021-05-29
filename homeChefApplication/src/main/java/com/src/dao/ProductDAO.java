package com.src.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.src.entity.CategoryEntity;

public class ProductDAO {
	private SessionFactory factory;

	public ProductDAO(SessionFactory factory) {
		this.factory = factory;
	}

	// Save to DB
	public int saveCategory(CategoryEntity cat) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int catId = (Integer) session.save(cat);
		tx.commit();
		session.close();
		return catId;
	}

}
