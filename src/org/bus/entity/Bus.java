package org.bus.entity;

public class Bus {
    public String number;
    public String brand;
    public String route;
    public String model;

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Bus(String number, String brand, String route, String model) {
        this.number = number;
        this.brand = brand;
        this.route = route;
        this.model = model;
    }

    public Bus() {
    }
}
