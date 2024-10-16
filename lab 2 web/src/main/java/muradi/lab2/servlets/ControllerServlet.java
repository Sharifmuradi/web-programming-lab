package muradi.lab2.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("xval") != null && req.getParameter("yval") != null && req.getParameter("rval") != null &&
                req.getParameter("xval").trim() != "" && req.getParameter("yval").trim() != "" && req.getParameter("rval").trim() != "") {
            System.out.printf("x : %s , y : %s , r : %s%n",req.getParameter("xval"),req.getParameter("yval"),req.getParameter("rval"));
            System.out.flush();
            req.getRequestDispatcher("/areaCheck").forward(req, resp);
//            getServletContext().getNamedDispatcher("AreaCheckServlet").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath());
    }
}
