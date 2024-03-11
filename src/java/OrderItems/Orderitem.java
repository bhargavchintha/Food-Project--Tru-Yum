package OrderItems;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Orderitem {
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
    
    // Constructor   addresstype
    public Orderitem(ResultSet resultSet) throws SQLException {
        this.orderid = resultSet.getString("orderid");
        this.email = resultSet.getString("email");
        this.itemlist = resultSet.getString("itemlist");
        this.coupons = resultSet.getString("coupons");
        this.orderaddress = resultSet.getString("orderaddress");
        this.grandtotalamount = resultSet.getString("grandtotalamount");
        this.payment = resultSet.getString("payment");
        this.randomtime = resultSet.getString("randomtime");
        this.date = resultSet.getString("date");
        this.clock = resultSet.getString("clock");
        this.orderstatus = resultSet.getString("orderstatus");
        this.nameitems = resultSet.getString("nameitems");
        this.addresshouse = resultSet.getString("addresshouse");
        this.addresstype = resultSet.getString("addresstype");
        this.drivername = resultSet.getString("drivername");
        this.drivernumber = resultSet.getString("drivernumber");
        this.subtotal = resultSet.getString("subtotal");
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
