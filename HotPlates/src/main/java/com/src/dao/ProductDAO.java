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

	// To get the ALL Category List in Dropdown for New product entry.
	public List<ProductEntity> getAllProduct() {
		Session listSession = this.factory.openSession();
		Query listQuery = listSession.createQuery("from ProductEntity");
		List<ProductEntity> list = listQuery.list();
		return list;
	}
	
	// To get All products based on ID / Category.
		public List<ProductEntity> getAllProductById(int cid) {
			Session listSession = this.factory.openSession();
			Query listQuery = listSession.createQuery("from ProductEntity as p where p.categoryEntity.categoryId =:id");
			listQuery.setParameter("id", cid);
			List<ProductEntity> list = listQuery.list();
			return list;
		}
}
