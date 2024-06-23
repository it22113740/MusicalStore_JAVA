/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.82
 * Generated at: 2024-04-29 04:28:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.ProductDao;
import java.util.*;
import cn.techtutorial.model.*;

public final class cart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/includes/head.jsp", Long.valueOf(1713428451000L));
    _jspx_dependants.put("/includes/footer.jsp", Long.valueOf(1713428465000L));
    _jspx_dependants.put("/includes/navbar.jsp", Long.valueOf(1714364898000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("cn.techtutorial.model");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("cn.techtutorial.dao.ProductDao");
    _jspx_imports_classes.add("java.text.DecimalFormat");
    _jspx_imports_classes.add("cn.techtutorial.connection.DbCon");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

DecimalFormat dcf = new DecimalFormat("#.##");

request.setAttribute("dcf",dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

List<Cart> cartProduct = null;
if(cart_list != null){
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total =pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list",cart_list);
	request.setAttribute("total",total);
}


      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Cart Page</title>\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".table tbody td{\r\n");
      out.write("vertical-align:middle;\r\n");
      out.write("}\r\n");
      out.write(".btn-incre, .btn-decre{\r\n");
      out.write("box-shadow:none;\r\n");
      out.write("font-size:25px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<a class=\"navbar-brand\" href=\"index.jsp\">JAZZ Musical Instrument Store</a>\r\n");
      out.write("		<button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\"\r\n");
      out.write("			data-target=\"#navbarSupportedContent\"\r\n");
      out.write("			aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\"\r\n");
      out.write("			aria-label=\"Toggle navigation\">\r\n");
      out.write("			<span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("		</button>\r\n");
      out.write("\r\n");
      out.write("		<div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("			<ul class=\"navbar-nav ml-auto\">\r\n");
      out.write("				<li class=\"nav-item active\"><a class=\"nav-link\"\r\n");
      out.write("					href=\"index.jsp\">Home </a></li>\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\" href=\"cart.jsp\">Cart<span\r\n");
      out.write("						class=\"badge badge-danger px-1\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ cart_list.size()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</span></a></li>\r\n");
      out.write("				");

				if (auth != null) {
				
      out.write("\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\" href=\"orders.jsp\">Orders</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\" href=\"log-out\">Logout</a></li>\r\n");
      out.write("				");

				} else {
				
      out.write("\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\" href=\"login.jsp\">Login</a></li>\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\"\r\n");
      out.write("					href=\"registration.jsp\">Register </a></li>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("				\r\n");
      out.write("\r\n");
      out.write("			</ul>\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</nav>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"d-flex py-3\">\r\n");
      out.write("			<h3>Total Price: $ ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ (total>0)?dcf.format(total):0 }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h3>\r\n");
      out.write("			<a class=\"mx-3 btn btn-primary\" href=\"cart-check-out\">Check Out</a>\r\n");
      out.write("		</div>\r\n");
      out.write("		<table class=\"table table-loght\">\r\n");
      out.write("			<thead>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th scope=\"col\">Name</th>\r\n");
      out.write("					<th scope=\"col\">Category</th>\r\n");
      out.write("					<th scope=\"col\">Price</th>\r\n");
      out.write("					<th scope=\"col\">Buy Now</th>\r\n");
      out.write("					<th scope=\"col\">Cancel</th>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</thead>\r\n");
      out.write("			<tbody>\r\n");
      out.write("			");
 if(cart_list != null){
				for(Cart c:cartProduct){
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("					<td>");
      out.print( c.getName());
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print( c.getCategory() );
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print( dcf.format(c.getPrice()) );
      out.write("</td>\r\n");
      out.write("					<td>\r\n");
      out.write("						<form action=\"order-now\" method=\"post\" class=\"form-inline\">\r\n");
      out.write("							<input type=\"hidden\" name=\"id\" value=\"");
      out.print( c.getId() );
      out.write("\" class=\"form-input\">\r\n");
      out.write("							<div class=\"form-group d-flex justify-content-between w-50\">\r\n");
      out.write("								<a class=\"btn btn-sm btn-decre\" href=\"quantity-inc-dec?action=dec&id=");
      out.print( c.getId());
      out.write("\"><i\r\n");
      out.write("									class=\"fas fa-minus-square\"></i></a> <input type=\"text\"\r\n");
      out.write("									name=\"quantity\" class=\"form-control w-50\" value=\"");
      out.print( c.getQuantity() );
      out.write("\" readonly>\r\n");
      out.write("								<a class=\"btn btn-sm btn-incre\" href=\"quantity-inc-dec?action=inc&id=");
      out.print( c.getId());
      out.write("\"><i\r\n");
      out.write("									class=\"fas fa-plus-square\"></i></a>\r\n");
      out.write("							</div>\r\n");
      out.write("							<button type=\"submit\" class=\"btn btn-primary btn-sm\">Buy</button>\r\n");
      out.write("						</form>\r\n");
      out.write("					</td>\r\n");
      out.write("					<td><a class=\"btn btn-sm btn-danger\" href=\"remove-from-cart?id=");
      out.print( c.getId());
      out.write("\">Remove</a></td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				");
 }
				
				}
      out.write("\r\n");
      out.write("\r\n");
      out.write("				\r\n");
      out.write("\r\n");
      out.write("			</tbody>\r\n");
      out.write("\r\n");
      out.write("		</table>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	");
      out.write("<script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" ></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" ></script>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
