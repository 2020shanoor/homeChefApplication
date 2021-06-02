package com.src.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.src.entity.CategoryEntity;
import com.src.entity.UserEntity;

public class CategoryDAO {
	private SessionFactory factory;

	public CategoryDAO(SessionFactory factory) {
		this.factory = factory;
	}

	// Save to DB
	public int saveCategory(CategoryEntity cat) {
		Session saveSession = this.factory.openSession();
		Transaction tx = saveSession.beginTransaction();
		int catId = (Integer) saveSession.save(cat);
		tx.commit();
		saveSession.close();
		return catId;
	}

	// To get the Category List in Dropdown for New product entry.
	public List<CategoryEntity> getCategories() {
		Session listSession = this.factory.openSession();
		Query listQuery = listSession.createQuery("from CategoryEntity");
		List<CategoryEntity> list = listQuery.list();
		return list;
	}

	public CategoryEntity getCategoryEntity(int cId) {
		CategoryEntity cat = null;
		try {
			Session session = this.factory.openSession();
			cat = (CategoryEntity) session.get(CategoryEntity.class, cId);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
}
