package org.apache.jsp.catalog;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import app.classes.Vehicle;

public final class catalog_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Car Rental Catalogue | Rent Easy</title>\n");
      out.write("        <!-- Bootstrap 5 CSS -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("            .header-logo {\n");
      out.write("                font-family: 'Pacifico', cursive;\n");
      out.write("                color: #007bff;\n");
      out.write("            }\n");
      out.write("            .header-nav a {\n");
      out.write("                margin: 0 15px;\n");
      out.write("                color: #333;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            .header-nav a:hover {\n");
      out.write("                color: #007bff;\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("            .catalog-title {\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("                color: #007bff;\n");
      out.write("            }\n");
      out.write("            .car-card {\n");
      out.write("                transition: transform 0.2s ease;\n");
      out.write("            }\n");
      out.write("            .car-card:hover {\n");
      out.write("                transform: scale(1.05);\n");
      out.write("            }\n");
      out.write("            .car-title {\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("            .car-info {\n");
      out.write("                color: #6c757d;\n");
      out.write("            }\n");
      out.write("            .car-price {\n");
      out.write("                font-size: 1.2rem;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #28a745;\n");
      out.write("            }\n");
      out.write("            .make-request {\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: #fff;\n");
      out.write("                padding: 10px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: block;\n");
      out.write("                border-radius: 0 0 0.25rem 0.25rem;\n");
      out.write("                transition: background-color 0.2s ease;\n");
      out.write("            }\n");
      out.write("            .make-request:hover {\n");
      out.write("                background-color: #0056b3;\n");
      out.write("            }\n");
      out.write("            .footer {\n");
      out.write("                padding: 20px 0;\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("                text-align: center;\n");
      out.write("                margin-top: 30px;\n");
      out.write("                color: #6c757d;\n");
      out.write("            }\n");
      out.write("            .footer a {\n");
      out.write("                color: #007bff;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            .footer a:hover {\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- Header Section -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Main Content Section -->\n");
      out.write("        <div class=\"container mt-5\">\n");
      out.write("            <h1 class=\"catalog-title text-center\">Explore Our Car Rentals</h1>\n");
      out.write("            \n");
      out.write("            ");
 
                String status = request.getParameter("s");

                if (status != null) {
                    String alertType = "";
                    String message = "";
                    if ("1".equals(status)) {
                        alertType = "success";
                        message = "Successfully added your request!";
                    } else if ("0".equals(status)) {
                        alertType = "danger";
                        message = "There was an error processing your request.";
                    }
            
      out.write("\n");
      out.write("                <div class=\"alert alert-");
      out.print( alertType );
      out.write(" alert-dismissible fade show\" role=\"alert\">\n");
      out.write("                    ");
      out.print( message );
      out.write("\n");
      out.write("                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n");
      out.write("                </div>\n");
      out.write("            ");
 
                }
            
      out.write("\n");
      out.write("            \n");
      out.write("            <div class=\"row row-cols-1 row-cols-md-3 g-4\">\n");
      out.write("                ");

                    // Get the list of vehicles from the database
                    Vehicle vehicleObj = new Vehicle();
                    List<Vehicle> vehicleList = vehicleObj.getVehicles();

                    // Loop through the list of vehicles and generate the HTML for each vehicle
                    for (Vehicle vehicle : vehicleList) {
                
      out.write("\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"card car-card shadow-sm h-100\">\n");
      out.write("                        <img src=\"");
      out.print( vehicle.getImagePath());
      out.write("\" alt=\"");
      out.print( vehicle.getModel());
      out.write("\" class=\"car-image card-img-top\" style=\"width: 100%; height: 200px; object-fit: cover;\">\n");
      out.write("                        <div class=\"card-body car-details\">\n");
      out.write("                            <h5 class=\"car-title\">");
      out.print( vehicle.getModel());
      out.write("</h5>\n");
      out.write("                            <p class=\"car-info\">Brand: ");
      out.print( vehicle.getBrand());
      out.write(" | Year: ");
      out.print( vehicle.getYear());
      out.write("</p>\n");
      out.write("                            <p class=\"car-price\">Price: Rs. ");
      out.print( vehicle.getPrice());
      out.write("/day</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"card-footer p-0\">\n");
      out.write("                            <a href=\"add_customer.jsp\" class=\"make-request text-center\">Make Request</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Footer Section -->\n");
      out.write("       ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Bootstrap 5 JS and dependencies -->\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
