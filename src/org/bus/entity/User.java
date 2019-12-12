package org.bus.entity;

public class User {
    private String uname;
    private String upwd;
    private int ubalance;

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public int getUbalance() {
        return ubalance;
    }

    public void setUbalance(int ubalance) {
        this.ubalance = ubalance;
    }

    public User(String uname, String upwd) {
        this.uname = uname;
        this.upwd = upwd;
    }

    public User(String uname, String upwd, int ubalance) {
        this.uname = uname;
        this.upwd = upwd;
        this.ubalance = ubalance;
    }

    public User() {
    }
}
