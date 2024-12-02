package csd430.eshop;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import csd430.eshop.model.DataManager;

//@WebServlet(name = "ShopServlet", urlPatterns = {"/shop/*"})
public class ShopServlet extends jakarta.servlet.http.HttpServlet
        implements jakarta.servlet.Servlet {
  private static final long serialVersionUID = 1L;

  public ShopServlet() {
    super();
    System.out.println("Testing constructor");
  }

  public void init(ServletConfig config) throws ServletException {
    super.init(config);

    DataManager dataManager = new DataManager();
    dataManager.setDbURL(config.getInitParameter("dbURL"));
    dataManager.setDbUserName(config.getInitParameter("dbUserName"));
    dataManager.setDbPassword(config.getInitParameter("dbPassword"));

    ServletContext context = config.getServletContext();
    context.setAttribute("base", config.getInitParameter("base"));
    context.setAttribute("imageURL", config.getInitParameter("imageURL"));
    context.setAttribute("dataManager", dataManager);
    System.out.println("Testing init");

    try {  // load the database JDBC driver
      Class.forName(config.getInitParameter("jdbcDriver"));
    }
    catch (ClassNotFoundException e) {
      System.out.println(e.toString());
    }
  }

  protected void doGet(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  protected void doPost(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
    String base = "/jsp/";
    String url = base + "index.jsp";
    String action = request.getParameter("action");
    if (action != null) {
      switch (action) {
        case "search":
          url = base + "SearchOutcome.jsp";
          break;
        case "selectCatalog":
          url = base + "SelectCatalog.jsp";
          break;
        case "bookDetails":
          url = base + "BookDetails.jsp";
          break;
        case "checkOut":
          url = base + "Checkout.jsp";
          break;
        case "orderConfirmation":
          url = base + "OrderConfirmation.jsp";
          break;
        default:
          if (action.matches("(showCart|(add|update|delete)Item)"))
            url = base + "ShoppingCart.jsp";
          break;
      }
    }
    RequestDispatcher requestDispatcher =
            getServletContext().getRequestDispatcher(url);
    requestDispatcher.forward(request, response);
  }
}
