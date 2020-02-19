/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Cuenta;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Hyperior
 */
public class BrokerCuenta {

    Session session = null;

    public BrokerCuenta() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public List getCuenta(String usuario, String password) {
        Transaction tx = this.session.beginTransaction();
        List<Cuenta> listaCuentas = null;

        try {

            String hql = "from entidades.Cuenta as cuenta where cuenta.usuario = :nombre and cuenta.password = :pass";
            //Query query = session.createQuery("from entidades.Cuenta as cuenta where cuenta.usuario = " + usuario);

            listaCuentas = (List<Cuenta>) session.createQuery(hql).setString("nombre", usuario).setString("pass", password).list();

            tx.commit();
        } catch (HibernateException Ex) {

            System.out.println("\nsalta por el catch");
            Ex.printStackTrace();
            tx.rollback();
        }

        return listaCuentas;
    }

}
