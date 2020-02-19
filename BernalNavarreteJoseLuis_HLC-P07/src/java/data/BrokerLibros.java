/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Cuenta;
import entidades.Libro;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Hyperior
 */
public class BrokerLibros {

    Session session = null;

    public BrokerLibros() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public List getAllBooks(String usuario, String orden) {
        Transaction tx = this.session.beginTransaction();
        List<Libro> listaLibro = null;

        try {

            String hql = "from entidades.Libro as libro where libro.propietario = :nombre order by libro.fechaPublicacion " + orden;
            //Query query = session.createQuery("from entidades.Cuenta as cuenta where cuenta.usuario = " + usuario);

            listaLibro = (List<Libro>) session.createQuery(hql).setString("nombre", usuario).list();

            tx.commit();
        } catch (HibernateException Ex) {

            System.out.println("\nsalta por el catch");
            Ex.printStackTrace();
            tx.rollback();
        }

        return listaLibro;
    }
    
    public List getBooksByYear(String year, String user, String orden) {
        Transaction tx = this.session.beginTransaction();
        List<Libro> listaLibro = null;

        try {

            String hql = "from entidades.Libro as libro where year(libro.fechaPublicacion) = :anio and libro.propietario = :prop order by libro.fechaPublicacion " + orden;
            //Query query = session.createQuery("from entidades.Cuenta as cuenta where cuenta.usuario = " + usuario);
            listaLibro = (List<Libro>) session.createQuery(hql).setString("anio", year).setString("prop", user).list();

            tx.commit();
        } catch (HibernateException Ex) {

            Ex.printStackTrace();
            tx.rollback();
        }

        return listaLibro;
    }

}
