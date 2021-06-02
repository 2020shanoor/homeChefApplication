package com.src.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Helper {
	public static String get10Words(String desc) {
		String[] str = desc.split(" ");

		if (str.length > 20) {
			String res = "";
			for (int i = 0; i < 20; i++) {
				res = res + str[i] + " ";
			}
			return (res + "...read more");
		} else {

			return desc + "...read more";
		}
	}

	public static Map<String,Long> getCounts(SessionFactory factory) {
		Session session = factory.openSession();
		String q1 = "Select count(*) from UserEntity";
		String q2 = "Select count(*) from ProductEntity";
		Query query1 = session.createQuery(q1);
		Query query2 = session.createQuery(q2);

		Long userCount = (Long)query1.list().get(0);
		Long productCount = (Long)query2.list().get(0);
		
		Map<String,Long> map = new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		
		session.close();
		return map;
	}
}