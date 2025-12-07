package com.app.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
private static SessionFactory sessionFactory = builtSessionFactory();
	
	private static SessionFactory builtSessionFactory() {
		try {
			if(sessionFactory == null) {
				StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
				
				MetadataSources sources = new MetadataSources(registry);
				Metadata metadata = sources.getMetadataBuilder().build();
				sessionFactory = metadata.getSessionFactoryBuilder().build();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new ExceptionInInitializerError(e);
		}
		return sessionFactory;
	}
	
	public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        getSessionFactory().close();
    }
	
}
