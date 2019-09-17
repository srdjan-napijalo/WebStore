/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author Srki
 */
public class MySession {

    public static Session createMySession()
    {
    Configuration c = new Configuration().configure();
    StandardServiceRegistryBuilder builder =
    new StandardServiceRegistryBuilder().applySettings(c.getProperties());
    SessionFactory f = c.buildSessionFactory(builder.build());
        return f.openSession();
    }
}