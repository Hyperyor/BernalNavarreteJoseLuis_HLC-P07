/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Escribe;
import entidades.Libro;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author alumno
 */
public class BrokerEscribe {
    
    Session session = null;

    public BrokerEscribe() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public List getAllData(String isbn) {
        Transaction tx = this.session.beginTransaction();
        List<Escribe> listaAutor = null;

        try {

            String hql = "from entidades.Escribe as escribe where escribe.id.isbn = :isbn";
            //Query query = session.createQuery("from entidades.Cuenta as cuenta where cuenta.usuario = " + usuario);

            listaAutor = (List<Escribe>) session.createQuery(hql).setString("isbn", isbn).list();

            tx.commit();
        } catch (HibernateException Ex) {

            System.out.println("\nsalta por el catch");
            Ex.printStackTrace();
            tx.rollback();
        }

        return listaAutor;
    }
    
}
