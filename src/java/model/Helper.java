/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Srki
 */
public class Helper {
    
        
         public static ArrayList<Purchase> getPurchasesByCustomer(Customer c)
        {
            int customerId = c.getCustomerId();
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Purchase p where p.customer.customerId = :c").setParameter("c", customerId);
            return (ArrayList<Purchase>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;      
        }
    
    
        public static ArrayList<Seen> getSeen(int customerFk, int productFk)
        {
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select s from Seen s where s.id.productFk="+productFk+" AND s.id.customerFk="+customerFk+"");
            return (ArrayList<Seen>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;      
        }
    
    
        public static Purchase getPurchase(int customerFk, int productFk)
        {
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Purchase p where p.id.productFk ="+productFk+" AND p.id.customerFk="+customerFk+"");
            return (Purchase)(q.list().get(0));
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;      
        }
        
        public static ArrayList<Purchase> getPurchases()
        {
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Purchase p");
            return (ArrayList<Purchase>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;      
        }
          public static ArrayList<Product> getProducts(String productName){
            Session session=null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Product as p where p.productName LIKE :n").setParameter("n", "%"+productName+"%");
            return (ArrayList<Product>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;   
        }
        
        public static Product getProductById(int productId){
            Session session=null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Product as p where p.productId = :i").setParameter("i", productId);
            return (Product)(q.list().get(0));
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;   
        }
        
        public static ArrayList<Product> getBeverage(String productName){
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Product as p  join p.beverage as b where p.beverage.beverageId=p.productId "
                   + "and p.productName LIKE :n").setParameter("n","%"+productName+"%");
            return (ArrayList<Product>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;      
        }
        
       public static ArrayList<Product> getFood(String productName){
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select p from Product as p  join p.food as f where f.foodId=p.productId "
                   + "and p.productName LIKE :n").setParameter("n","%"+productName+"%");
            return (ArrayList<Product>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;      
        }
       public static ArrayList<Customer> getCustomers(String email){
            Session session = null;
            try{
            session = MySession.createMySession();
            Query q= session.createQuery
           ("select c from Customer as c where c.email = :n").setParameter("n", email);
            return (ArrayList<Customer>)(q.list());
            }catch(HibernateException he)
            {
               he.printStackTrace();
            }
                finally{
              if(session!=null)  session.close();
            }
         return null;   
        }
       
       public static void remove(ParentEntity p){
           //first remove beverage/food and then remove product
            Session session = null;
            Transaction tr = null;
            try{
        session = MySession.createMySession();
        tr = session.beginTransaction();
        session.delete(p);
        tr.commit();
        }
        catch(HibernateException e)
        {
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        }
        }
    
       
       public static void update(ParentEntity p){
            //first fill product p and beverage/food bev and then bev.setProduct(p); ->insert(bev)
            Session session = null;
            Transaction tr = null;
            try{
        session = MySession.createMySession();
        tr = session.beginTransaction();
        session.saveOrUpdate(p);
        tr.commit();
        }
        catch(HibernateException e)
        {
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        }
        }
       
       
       public static void seenUpdate(Seen s){
            //first fill product p and beverage/food bev and then bev.setProduct(p); ->insert(bev)
            Session session = null;
            Transaction tr = null;
            try{
        session = MySession.createMySession();
        tr = session.beginTransaction();
        session.saveOrUpdate(s);
        tr.commit();
        }
        catch(HibernateException e)
        {
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        }
        }
       

        public static void insert(ParentEntity p){
            //first fill product p and beverage/food bev and then bev.setProduct(p); ->insert(bev)
            Session session = null;
            Transaction tr = null;
            try{
        session = MySession.createMySession();
        tr = session.beginTransaction();
        session.persist(p);
        tr.commit();
        }
        catch(HibernateException e)
        {
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        }
        }
        
        public static void seen(Customer c, Product p){
             Session session = null;
             Transaction tr = null;
        try
            {
          session = MySession.createMySession();
          Date dt = new Date();
          Seen seen = new Seen();
          seen.setCustomer(c);
          seen.setProduct(p);
          seen.setFirstTimeSeen(dt);
          seen.setLastTimeSeen(dt);
          seen.setTimesSeen(1);
          seen.setId(new SeenId(c.getCustomerId(),p.getProductId()));
        tr = session.beginTransaction();
        session.persist(seen);
        tr.commit();
        }
        catch(HibernateException e)
        {
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        } 
        }
        
        public static void purchase(Customer c, Product p){
            if(p.getQuantity()<1)return;
             Session session = null;
             Transaction tr = null;
        if(c.getAccountBalance().compareTo(p.getPrice())>=0)  
        try
            {
          session = MySession.createMySession();
          c.setPurchases(c.getPurchases()+1);
          p.setQuantity(p.getQuantity()-1);
          Date dt = new Date();
          Purchase pur = new Purchase();
          pur.setCustomer(c);
          pur.setProduct(p);
          pur.setTimeOfPurchase(dt);
          pur.setId(new PurchaseId(c.getCustomerId(),p.getProductId()));
        tr = session.beginTransaction();
        session.update(c);
        session.update(p);
        session.persist(pur);
        tr.commit();
        }
        catch(HibernateException e)
        {
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        } 
        }
        
        public static void removePurchase(Purchase pur){
            Customer c = pur.getCustomer();
            Product p = pur.getProduct();
            Session session = null;
             Transaction tr = null; 
        try
            {  
          session = MySession.createMySession();
          c.setAccountBalance(c.getAccountBalance().add(p.getPrice()));
          c.setPurchases(c.getPurchases()-1);
          p.setQuantity(p.getQuantity()+1);
        tr = session.beginTransaction();
        session.update(c);
        session.update(p);
        session.delete(pur);
        tr.commit();
        }
        catch(HibernateException e)
        {
            e.printStackTrace();
        tr.rollback();
        }
        finally
        {
        if(session!=null)
        session.close();
        } 
        }
    
        
    
        public static void main(String[] args) { 
           
            Customer c = Helper.getCustomers("new_customer@mail.com").get(0);
            
            ArrayList <Purchase> purs =  Helper.getPurchasesByCustomer(c);
            
            for(Purchase p:purs)
                System.out.println(p.getCustomer().getFirstName() + " "+ p.getProduct().getProductName());

// System.out.println(Helper.getSeen(5, 5));
        /* 
           Customer c = Helper.getCustomers("srdjan@gmail.com").get(0);
           ;
            Product p = Helper.getProductById(5);
           
            if((Helper.getSeen(c.getCustomerId(), p.getProductId()))==null){
            System.out.println(c.getCustomerId());
            Helper.seen(c, p);
           
        }else { 
           Seen seen = Helper.getSeen(c.getCustomerId(), p.getProductId());
           Date dt = new Date();
           seen.setTimesSeen(seen.getTimesSeen()+1);
           seen.setLastTimeSeen(dt);
            System.out.println(seen.getTimesSeen());
           Helper.seenUpdate(seen);
        }
      */   
         
    }
    
    
    
}
