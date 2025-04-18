package org.apache.jsp;

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
      out.write("    <meta charset=\"UTF-8\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("    <title>Login Page</title>\n");
      out.write("    <!-- Include Google Fonts -->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: 'Poppins', sans-serif;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container {\n");
      out.write("            display: flex;\n");
      out.write("            height: 100vh;\n");
      out.write("            align-items: center;\n");
      out.write("            justify-content: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-form {\n");
      out.write("            padding: 20px;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            background: white;\n");
      out.write("            margin-left: 100px;\n");
      out.write("            margin-right: 100px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .side-image {\n");
      out.write("            background: url(\"images/login_i.jpg\") no-repeat center center;\n");
      out.write("            background-size: cover;\n");
      out.write("            height: 100%;\n");
      out.write("            position: relative;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .company-info {\n");
      out.write("            position: absolute;\n");
      out.write("            top: 50%;\n");
      out.write("            left: 50%;\n");
      out.write("            transform: translate(-50%, -50%);\n");
      out.write("            color: white;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .company-info h1 {\n");
      out.write("            margin: 0;\n");
      out.write("            font-size: 3.3rem;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .company-info p {\n");
      out.write("            margin: 0;\n");
      out.write("            font-size: 1rem;\n");
      out.write("            color: gray;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @media (max-width: 767.98px) {\n");
      out.write("            .side-image {\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-form {\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 400px;\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row login-container\">\n");
      out.write("            <div class=\"col-md-6 d-none d-md-block side-image\">\n");
      out.write("                <div class=\"company-info\">\n");
      out.write("                    <h1>Rent Easy</h1>\n");
      out.write("                    <p>Your comfort, our priority</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6\">\n");
      out.write("                <div class=\"login-form\">\n");
      out.write("                    ");

                        String message = request.getParameter("message");
                        if (message != null) {
                            String type = request.getParameter("type");
                            String alertClass = "danger".equals(type) ? "alert-danger" : "alert-success";
                    
      out.write("\n");
      out.write("                    <div class=\"alert ");
      out.print( alertClass );
      out.write(" alert-dismissible fade show mt-3\" role=\"alert\">\n");
      out.write("                        ");
      out.print( message );
      out.write("\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("                            <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                        </button>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                    <h2 class=\"mb-4\">Welcome Back!</h2>\n");
      out.write("                    <p>Please enter your details</p>\n");
      out.write("                    <form action=\"login.jsp\" method=\"POST\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"email\">Email Address</label>\n");
      out.write("                            <input type=\"email\" class=\"form-control\" id=\"email\" name=\"email\" required />\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"password\">Password</label>\n");
      out.write("                            <input type=\"password\" class=\"form-control\" id=\"password\" name=\"password\" required />\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-dark btn-block mt-3 p-2\">Sign In</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("</body>\n");
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
