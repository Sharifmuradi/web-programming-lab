package muradi.lab2.beans;

import java.io.Serializable;

public class Entry implements Serializable {
    private double xValue;
    private double yValue;
    private double rValue;
    private boolean hitResult;

    public Entry() {
        this(0.0,0.0,0.0,false);
    }

    public Entry(double xValue, double yValue, double rValue, boolean hitResult) {
        this.xValue = xValue;
        this.yValue = yValue;
        this.rValue = rValue;
        this.hitResult = hitResult;
    }

    public void setxValue(double xValue) {
        this.xValue = xValue;
    }

    public void setyValue(double yValue) {
        this.yValue = yValue;
    }

    public void setrValue(double rValue) {
        this.rValue = rValue;
    }


    public void setHitResult(boolean hitResult) {
        this.hitResult = hitResult;
    }

    public double getxValue() {
        return xValue;
    }

    public double getyValue() {
        return yValue;
    }

    public double getrValue() {
        return rValue;
    }

    public boolean isHitResult() {
        return hitResult;
    }
}
