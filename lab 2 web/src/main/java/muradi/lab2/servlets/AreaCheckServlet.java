package muradi.lab2.servlets;

import muradi.lab2.beans.EntriesBean;
import muradi.lab2.beans.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;

public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String xString = req.getParameter("xval");
        String yString = req.getParameter("yval").replace(",", ".");
        String rString = req.getParameter("rval");
        boolean isValidParams = validateValues(xString, yString, rString);


        if (!isValidParams) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters.");
            return;
        }
        double xValue = Double.parseDouble(xString);
        double yValue = Double.parseDouble(yString);
        double rValue = Double.parseDouble(rString);
        boolean isHit = checkHit(xValue, yValue, rValue);


        EntriesBean entries = (EntriesBean) req.getSession().getAttribute("entries");
        if (entries == null) entries = new EntriesBean();
        Entry newEntry = new Entry(xValue, yValue, rValue, isHit);
        entries.getEntries().addFirst(newEntry);
        req.getSession().setAttribute("newEntry", newEntry);
        req.getSession().setAttribute("entries", entries);
        getServletContext().getRequestDispatcher("/result.jsp").forward(req, resp);


    }


    private boolean validateValues(String xString, String yString, String rString) throws IOException {
        return validateX(xString) && validateY(yString) && validateR(rString);
    }

    private boolean validateX(String xString) {
        try {
            Double[] xRange = {-3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0};
            double xValue = Double.parseDouble(xString);
            return Arrays.asList(xRange).contains(xValue);
        } catch (NumberFormatException exception){
            return false;
        }
    }

    private boolean validateY(String yString) {
        try {
            double yValue = Double.parseDouble(yString);
            return yValue >= -3.0 && yValue <= 3.0;
        } catch (NumberFormatException exception) {
            return false;
        }
    }

    private boolean validateR(String rString) {
        try {
            Double[] rRange = {1.0, 2.0, 3.0, 4.0, 5.0};
            double rValue = Double.parseDouble(rString);
            return Arrays.asList(rRange).contains(rValue);
        } catch (NumberFormatException exception) {
            return false;
        }
    }

    private boolean checkHit(double xValue, double yValue, double rValue) {
        return checkTriangle(xValue, yValue, rValue) || checkRectangle(xValue, yValue, rValue) || checkCircle(xValue, yValue, rValue);
    }

    private boolean checkTriangle(double xValue, double yValue, double rValue) {
        return xValue <= 0 && yValue >= 0 && yValue <= (xValue + rValue / 2);
    }

    private boolean checkCircle(double xValue, double yValue, double rValue) {
        return xValue >= 0 && yValue <= 0 && (xValue * xValue + yValue * yValue) <= rValue * rValue;
    }

    private boolean checkRectangle(double xValue, double yValue, double rValue) {
        return xValue <= 0 && xValue >= (-1 * rValue) && yValue <= 0 && yValue >= (-1 * rValue);
    }
}
