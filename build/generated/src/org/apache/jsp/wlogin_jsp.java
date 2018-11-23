package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class wlogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<html lang=\"en\" >\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>LNCT Quiz Login</title>\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("\n");
      out.write("  \n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("  <a href=\"index.html\"><img src=\"./assets/images/backb.png\" alt=\"Back\" class=\"zoomimage\" height=\"55\" width=\"55\" Style=\"margin-left: 30px; margin-top: 30px; margin-bottom: 0px;\"></a>\n");
      out.write("\n");
      out.write("  <div class=\"login-page\">\n");
      out.write("  <div class=\"form\">\n");
      out.write("      <a href=\"index.html\"><img src=\"assets/images/lnct.png\" height=\"75\" width=\"250\"/></a>\n");
      out.write("      <form class=\"register-form\" method=\"post\" action=\"tloginprocess.jsp\">\n");
      out.write("       <h3>Teacher Login</h3>\n");
      out.write("       <h6 style=\"color: red;\">Invalid Username/Password</h6>\n");
      out.write("      <input type=\"text\" placeholder=\"Username(Employee Id)\" name = \"username\" required/>\n");
      out.write("      <input type=\"password\" placeholder=\"Password\" name = \"password\" required/>\n");
      out.write("      <button>LOGIN</button>\n");
      out.write("       <p class=\"message\">Sign In As Student <a href=\"#\">Sign In</a></p>\n");
      out.write("    </form>\n");
      out.write("      \n");
      out.write("    <form class=\"login-form\" method=\"post\" action=\"loginprocess.jsp\">\n");
      out.write("        <h3>Student Login</h3>\n");
      out.write("        <h6 style=\"color: red;\">Invalid Username/Password</h6>\n");
      out.write("      \t<input type=\"text\" placeholder=\"Username(Enrollment No.)\" name = \"username\" required/>\n");
      out.write("      \t<input type=\"password\" placeholder=\"Password\" name = \"password\" required/>\n");
      out.write("      \t<button>LOGIN</button>\n");
      out.write("        <p class=\"message\">Sign In As Teacher <a href=\"#\">Sign In</a></p>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("    <script  src=\"js/index.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
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
