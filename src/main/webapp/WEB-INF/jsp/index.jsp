<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.E_Commerce_Application.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.E_Commerce_Application.entity.Product" %>
<%@ page import="com.example.E_Commerce_Application.helper.Helper" %>
<%@ page import="com.example.E_Commerce_Application.entity.User" %>

<%
    List<Product> list = (List<Product>) request.getAttribute("list");
%>


<!-- Pagination logic-->
<%
    Integer currentPage = (Integer) request.getAttribute("currentPage");
    Integer totalPages = (Integer) request.getAttribute("totalPages");

    if(currentPage == null){
        currentPage = 1;
    }

    if(totalPages == null){
        totalPages = 1;
    }
%>







<%
String lang = (String) session.getAttribute("lang");
if (lang == null) lang = "en";
%>
<html data-bs-theme="light">
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <jsp:include page="/components/common_css_js.jsp" />


</head>
<body>
<jsp:include page="/components/navbar.jsp" />

<!-- SEARCH BAR HERE -->

<div class="row mt-3 mx-2">


<!-- ================= SEARCH BAR START ================= -->

    <div class="container-fluid">

        <div class="row justify-content-center align-items-center">

            <!-- Location Box -->

            <div class="col-md-2">

                <div class="location-box"
                     data-toggle="modal"
                     data-target="#locationModal">

                    <i class="fa fa-map-marker-alt location-icon"></i>

                    <div>

                        <small class="text-muted">
                            Deliver To
                        </small>

                        <div class="location-text">

                            <%
                                User currentUser =
                                        (User) session.getAttribute("current-user");

                                if(currentUser != null &&
                                        currentUser.getCity() != null){

                            %>

                            <%= currentUser.getCity() %>
                            -
                            <%= currentUser.getPincode() %>

                            <%
                            } else {
                            %>

                            Update Location

                            <%
                                }
                            %>

                        </div>

                    </div>

                </div>

            </div>

            <!-- Search Bar -->

            <div class="col-md-8">

                <form action="/" method="get">

                    <div class="search-box shadow-lg">

                        <input type="text"
                               name="keyword"
                               class="form-control search-input"
                               placeholder="Search products here..."
                               value="<%= request.getAttribute("keyword") != null ? request.getAttribute("keyword") : "" %>">

                        <button class="btn search-btn">

                            <i class="fa fa-search"></i>

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>
<!-- ================= SEARCH BAR END =================-->




<style>
.list-group-item {
    transition: all 0.3s ease;
}

.list-group-item:hover {
    background-color: #f8f9fa;  /* light grey  dene ke liye categories ko Home page me*/
    color: #0d6efd;
    transform: translateX(5px); /* thoda move karega */
    font-weight: 500;           /* CSS property that controls how bold text appears. The higher the number, the thicker (bolder) the text.*/
}
</style>

  <div class="row mt-3 mx-2">
       <!-- To show categories on Left side of home page(use only 2 coloumns for it) -->


              <div class="col-md-2">
                  <div class="list-group mt-4">

                      <%
                          String selected = request.getParameter("category");
                      %>

                      <a href="/?category=all"
                         class="list-group-item <%= (selected == null || selected.equals("all")) ? "active" : "" %>">
                          All Products
                      </a>

                      <%
                          List<Category> cList = (List<Category>) request.getAttribute("cList");
                          if (cList != null) {
                              for (Category c : cList) {
                      %>

                      <a href="/?category=<%= c.getCategoryId() %>"
                         class="list-group-item <%= selected != null && selected.equals(String.valueOf(c.getCategoryId())) ? "active" : "" %>">
                          <%= c.getCategoryTitle() %>
                      </a>

                      <%
                              }
                          }
                      %>

                  </div>
              </div>




       <!-- To show products on Right side of home page(use only 8 coloumns for it) -->
      <div class="col-md-10">
          <div class="row mt-4">

              <%
                  if (list != null && !list.isEmpty()) {
                      for (Product p : list) {
              %>

              <div class="col-md-3 mb-4">
                  <div class="card h-100 shadow-sm">

                      <!-- Image -->
                      <div class="text-center">
                          <img src="<%= p.getpPhoto() %>"
                               class="card-img-top p-3"
                               style="height:200px; object-fit:contain;">
                      </div>

                      <!-- Body -->
                      <div class="card-body">
                          <h5><%= p.getpName() %></h5>


                          <p class="text-muted">
                              <%= Helper.get10Words(p.getpDesc()) %>
                          </p>
                      </div>

                      <!-- Footer: To show price after Discount and original price with discount in percentage -->
                      <div class="card-footer d-flex justify-content-between">

                         <!-- <button class="btn btn-primary btn-sm">
                              Add to Cart
                          </button>  -->

                          <button class="btn btn-primary btn-sm"
                                  onclick="add_to_cart(
                                      <%= p.getpId() %>,
                                          '<%= p.getpName() %>',
                                      <%= p.getPriceAfterApplyingDiscount() %>
                                          )">
                              Add to Cart
                          </button>



                          <div class="d-flex flex-column">
                            <span class="text-success fw-bold fs-5">
                            ₹ <%= p.getPriceAfterApplyingDiscount() %>
                            </span>
                             <div>
                                  <small class="text-muted text-decoration-line-through">
                                      ₹ <%= p.getpPrice() %>
                                  </small>
                                  <small class="text-danger ms-2">
                                      <%= p.getpDiscount() %>% OFF
                                  </small>
                             </div>
                          </div>



                      </div>

                  </div>
              </div>

              <%
                  }
              } else {
              %>

              <h3>No Products Available</h3>

              <%
                  }
              %>

          </div>
      </div>
  </div>



<!-- ================= PAGINATION START ================= -->

<div class="d-flex justify-content-center mt-4">

    <nav>

        <ul class="pagination">

            <!-- Previous Button -->
            <%
                if(currentPage > 1){
            %>

            <li class="page-item">

                <a class="page-link"
                   href="/?category=<%= selected == null ? "all" : selected %>&page=<%= currentPage - 1 %>">

                    Previous

                </a>

            </li>

            <%
                }
            %>

            <!-- Page Numbers -->
            <%
                for(int i = 1; i <= totalPages; i++){
            %>

            <li class="page-item <%= (i == currentPage) ? "active" : "" %>">

                <a class="page-link"
                   href="/?category=<%= selected == null ? "all" : selected %>&page=<%= i %>">

                    <%= i %>

                </a>

            </li>

            <%
                }
            %>

            <!-- Next Button -->
            <%
                if(currentPage < totalPages){
            %>

            <li class="page-item">

                <a class="page-link"
                   href="/?category=<%= selected == null ? "all" : selected %>&page=<%= currentPage + 1 %>">

                    Next

                </a>

            </li>

            <%
                }
            %>

        </ul>

    </nav>

</div>

<!-- ================= PAGINATION END ================= -->

</div>

<div class="modal fade"
     id="locationModal"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Update Delivery Location
                </h5>

                <button type="button"
                        class="close"
                        data-dismiss="modal">

                    &times;

                </button>

            </div>

            <div class="modal-body">

                <form action="/update-location"
                      method="post">

                    <div class="form-group">

                        <input type="text"
                               name="city"
                               class="form-control"
                               placeholder="Enter City"
                               required>

                    </div>

                    <br>

                    <div class="form-group">

                        <input type="text"
                               name="pincode"
                               class="form-control"
                               placeholder="Enter Pincode"
                               required>

                    </div>

                    <br>

                    <button type="submit"
                            class="btn btn-primary w-100">

                        Save Location

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

<jsp:include page="/components/chatbot.jsp" />
<jsp:include page="/components/common_modals.jsp" />
</body>
</html>