package com.src.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.src.entity.UserEntity;

public class UserLoginDAO {
	private SessionFactory factory;

	public UserLoginDAO(SessionFactory factory) {
		this.factory = factory;
	}
	// Get username and Password.

	public UserEntity getUserByEmailAndPassword(String email, String password) {
		UserEntity userEntity = null;
		try {

			String query  = "from UserEntity where userEmail =:e and userPassword =:p";
			Session session = this.factory.openSession();
			Query q= session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			userEntity = (UserEntity) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userEntity;
	}

}
