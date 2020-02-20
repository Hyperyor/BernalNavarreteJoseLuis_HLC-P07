/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Autor;
import entidades.Cuenta;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Hyperior
 */
public class BrokerAutor {
    Session session = null;

    public BrokerAutor() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public List getAutor(int cod) {
        Transaction tx = this.session.beginTransaction();
        List<Autor> listaAutor = null;

        try {

            String hql = "from entidades.Autor as autor where autor.codigo = :codigo";

            listaAutor = (List<Autor>) session.createQuery(hql).setInteger("codigo", cod).list();

            tx.commit();
        } catch (HibernateException Ex) {

            System.out.println("\nsalta por el catch");
            Ex.printStackTrace();
            tx.rollback();
        }

        return listaAutor;
    }
    
    public void updateAutor(int cod, String nombre, Float beneficio) {
        Transaction tx = this.session.beginTransaction();
        //List<Autor> listaAutor = null;
        int resultado;
        
        try {

            String hql = "update entidades.Autor as autor set autor.nombre = :name"
                    + ", autor.porcentajeBeneficio = :ben where autor.codigo = :codigo";

            resultado = session.createQuery(hql).setString("name", nombre).setFloat("ben", beneficio).setInteger("codigo", cod).executeUpdate();

            tx.commit();
        } catch (HibernateException Ex) {

            System.out.println("\nsalta por el catch");
            Ex.printStackTrace();
            tx.rollback();
        }

        //return listaAutor;
    }
    
}
