// Orderdeleteitems.java
package Orderitemsdelete;

import java.sql.ResultSet;
import java.sql.SQLException;


public class Orderdeleteitems {
    private String orderid;
    private String email;
    private String itemlist;
    private String coupons;
    private String orderaddress;
    private String grandtotalamount;
    private String payment;
    private String randomtime;
    private String date;
    private String clock;
    private String orderstatus;
    private String nameitems;
    private String addresshouse;
    private String addresstype;
    private String drivername;
    private String drivernumber;
    private String subtotal;
     
     //statement.setString(15, drivername);
       //         statement.setString(16, drivenumber);
    
    
    // Constructor    
    public Orderdeleteitems(String orderid, String email, String itemlist, String coupons, String orderaddress,
                            String grandtotalamount, String payment, String randomtime, String date, String clock,
                            String orderstatus, String nameitems, String addresshouse, String addresstype, String drivername, String drivernumber, String subtotal  ) { 
        this.orderid = orderid;
        this.email = email;
        this.itemlist = itemlist;
        this.coupons = coupons;
        this.orderaddress = orderaddress;
        this.grandtotalamount = grandtotalamount;
        this.payment = payment;
        this.randomtime = randomtime;
        this.date = date;
        this.clock = clock;
        this.orderstatus = orderstatus;
        this.nameitems = nameitems; 
        this.addresshouse = addresshouse; 
        this.addresstype = addresstype;
        this.drivername = drivername;
        this.drivernumber = drivernumber;
        this.subtotal = subtotal;
    }

    Orderdeleteitems(String string, String string0, String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10, String string11, String string12, String string13, String string14) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // Getters and setters
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getItemlist() {
        return itemlist;
    }

    public void setItemlist(String itemlist) {
        this.itemlist = itemlist;
    }

    public String getCoupons() {
        return coupons;
    }

    public void setCoupons(String coupons) {
        this.coupons = coupons;
    }

    public String getOrderaddress() {
        return orderaddress;
    }

    public void setOrderaddress(String orderaddress) {
        this.orderaddress = orderaddress;
    }

    public String getGrandtotalamount() {
        return grandtotalamount;
    }

    public void setGrandtotalamount(String grandtotalamount) {
        this.grandtotalamount = grandtotalamount;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getRandomtime() {
        return randomtime;
    }

    public void setRandomtime(String randomtime) {
        this.randomtime = randomtime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getClock() {
        return clock;
    }

    public void setClock(String clock) {
        this.clock = clock;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }
    public String getNameitems() {
        return nameitems;
    }

    public void setNameitems(String nameitems) {
        this.nameitems = nameitems;
    }
    public String getAddresshouse() {
        return addresshouse;
    }

    public void setAddresshouse(String addresshouse) {
        this.addresshouse = addresshouse;
    }
    public String getAddresstype() {
        return addresstype;
    }

    public void setAddresstype(String addresstype) {
        this.addresstype = addresstype;
    }
    
    public String getDrivername() {
        return drivername;
    }

    public void setDrivername(String drivername) {
        this.drivername = drivername;
    }
    
    public String getDrivernumber() {
        return drivernumber;
    }

    public void setDrivernumber(String drivernumber) {
        this.drivernumber = drivernumber;
    }
    
     public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }
    
}
