package com.notetaker.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	public static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		
		if(factory==null) {
//			factory = new Configuration().configure("resources/hibernate.cfg.xml").buildSessionFactory();
			factory = new Configuration().configure().buildSessionFactory();
			
		}
		
		return factory;
	}
	
	public void closeFactory() {
		
		if(factory.isOpen()) {
			factory.close();
		}
	}
}
