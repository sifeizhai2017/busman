package org.bus.entity;

public class Route {
    public String name;
    public String time;
    public String start;
    public String end;
    public String via;
    public int count;
    public int price;
    public int seat;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public Route(String name, String time, String start, String end, String via, int count, int price, int seat) {
        this.name = name;
        this.time = time;
        this.start = start;
        this.end = end;
        this.via = via;
        this.count = count;
        this.price = price;
        this.seat = seat;
    }

    public Route() {
    }
}
