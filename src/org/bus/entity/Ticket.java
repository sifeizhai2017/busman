package org.bus.entity;

public class Ticket {
    public int uid;
    public String uname;
    public String uticket;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUticket() {
        return uticket;
    }

    public void setUticket(String uticket) {
        this.uticket = uticket;
    }

    public Ticket(int uid, String uname, String uticket) {
        this.uid = uid;
        this.uname = uname;
        this.uticket = uticket;
    }

    public Ticket(String uname, String uticket) {
        this.uname = uname;
        this.uticket = uticket;
    }

    public Ticket() {
    }
}
