package org.apache.jsp.catalog;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Rent Easy - Your Best Choice for Car Rentals</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\">Rent Easy</a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("                <ul class=\"navbar-nav ms-auto\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link active\" aria-current=\"page\" href=\"#\">Home</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#catalog\">Catalog</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#about\">About Us</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#contact\">Contact</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <!-- Hero Section -->\n");
      out.write("    <header class=\"bg-primary text-white text-center py-5\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1 class=\"display-4\">Rent Easy: Your Perfect Ride Awaits</h1>\n");
      out.write("            <p class=\"lead\">Experience hassle-free car rentals at unbeatable prices</p>\n");
      out.write("            <a href=\"#catalog\" class=\"btn btn-light btn-lg\">Browse Our Catalog</a>\n");
      out.write("        </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <!-- Catalog Section -->\n");
      out.write("    <section id=\"catalog\" class=\"py-5\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2 class=\"text-center mb-5\">Our Catalog</h2>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-4 mb-4\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <img src=\"https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1\" class=\"card-img-top\" alt=\"Economy Car\">\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h5 class=\"card-title\">Economy Car</h5>\n");
      out.write("                            <p class=\"card-text\">Perfect for city driving and fuel efficiency.</p>\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary\">Rent Now</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4 mb-4\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <img src=\"https://images.pexels.com/photos/1592261/pexels-photo-1592261.jpeg?auto=compress&cs=tinysrgb&w=600\" class=\"card-img-top\" alt=\"SUV\">\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h5 class=\"card-title\">SUV</h5>\n");
      out.write("                            <p class=\"card-text\">Ideal for family trips and outdoor adventures.</p>\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary\">Rent Now</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4 mb-4\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <img src=\"https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1\" class=\"card-img-top\" alt=\"Luxury Sedan\">\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h5 class=\"card-title\">Luxury Sedan</h5>\n");
      out.write("                            <p class=\"card-text\">Experience comfort and style on your journey.</p>\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary\">Rent Now</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"text-center mt-4\">\n");
      out.write("                <a href=\"#\" class=\"btn btn-outline-primary btn-lg\">View Full Catalog</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- About Us Section -->\n");
      out.write("    <section id=\"about\" class=\"py-5 bg-light\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2 class=\"text-center mb-5\">About Rent Easy</h2>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                    <p>Rent Easy is your trusted partner for all your car rental needs. With a wide range of vehicles and a commitment to customer satisfaction, we make renting a car easy and enjoyable.</p>\n");
      out.write("                    <p>Our mission is to provide high-quality, well-maintained vehicles at competitive prices, ensuring that your journey is comfortable, safe, and hassle-free.</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                    <h4>Why Choose Rent Easy?</h4>\n");
      out.write("                    <ul>\n");
      out.write("                        <li>Wide selection of vehicles</li>\n");
      out.write("                        <li>Competitive pricing</li>\n");
      out.write("                        <li>Excellent customer service</li>\n");
      out.write("                        <li>Flexible rental options</li>\n");
      out.write("                        <li>Clean and well-maintained fleet</li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Contact Section -->\n");
      out.write("    <section id=\"contact\" class=\"py-5\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2 class=\"text-center mb-5\">Contact Us</h2>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6 mb-4\">\n");
      out.write("                    <h4>Get in Touch</h4>\n");
      out.write("                    <form>\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"name\" class=\"form-label\">Name</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"name\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"email\" class=\"form-label\">Email</label>\n");
      out.write("                            <input type=\"email\" class=\"form-control\" id=\"email\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"message\" class=\"form-label\">Message</label>\n");
      out.write("                            <textarea class=\"form-control\" id=\"message\" rows=\"4\" required></textarea>\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\">Send Message</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-6 mb-4\">\n");
      out.write("                    <h4>Our Location</h4>\n");
      out.write("                    <p>123 Car Rental Street<br>Anytown, ST 12345<br>United States</p>\n");
      out.write("                    <h4>Contact Information</h4>\n");
      out.write("                    <p>Phone: (123) 456-7890<br>Email: info@renteasy.com</p>\n");
      out.write("                    <h4>Business Hours</h4>\n");
      out.write("                    <p>Monday - Friday: 8:00 AM - 8:00 PM<br>Saturday - Sunday: 9:00 AM - 6:00 PM</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Footer -->\n");
      out.write("    <footer class=\"bg-dark text-white text-center py-4\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <p>&copy; 2024 Rent Easy. All rights reserved.</p>\n");
      out.write("            <div class=\"social-icons\">\n");
      out.write("                <a href=\"#\" class=\"text-white me-3\"><i class=\"bi bi-facebook\"></i></a>\n");
      out.write("                <a href=\"#\" class=\"text-white me-3\"><i class=\"bi bi-twitter\"></i></a>\n");
      out.write("                <a href=\"#\" class=\"text-white me-3\"><i class=\"bi bi-instagram\"></i></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
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
