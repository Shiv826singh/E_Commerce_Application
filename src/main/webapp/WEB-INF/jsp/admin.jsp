<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";
%>
<!DOCTYPE html>
<html data-bs-theme="light">
<head>

    <title>Admin Page</title>
    <jsp:include page="/components/common_css_js.jsp" />
    <style>
        #chartContainer{
            width:500px;
            height:500px;
            margin:30px auto;

            background: transparent !important;
            border:none !important;
            box-shadow:none !important;
        }

    </style>

</head>

<body class="admin-bg">
<jsp:include page="/components/navbar.jsp" />

<div class="container mt-3">

    <%
        String msg = (String) session.getAttribute("msg");
        if (msg != null) {
    %>

    <div id="msgBox" class="alert alert-info text-center">
        <%= msg %>
    </div>

    <script>
        setTimeout(function () {
            var msg = document.getElementById("msgBox");
            if (msg) {
                msg.style.display = "none";
            }
        }, 5000); // 5000 ms = 5 sec
    </script>

    <%
            session.removeAttribute("msg");
        }
    %>

</div>

<div class="container">
    <div class="row my-2 py-2">

        <!--first col-->
        <div class="col-md-4">
            <div class="card" style="background-color: lightpink;">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 80px;" class="img-fluid rounded-circle"
                             src="/img/usericon.jpeg" alt="user_icon">
                    </div>
                    <p>Current Registered Users!!</p>
                    <h2>${userCount}</h2> <!-- return count from AdminController-->
                    <h2>Users</h2>

                </div>
            </div>

        </div>

        <!--second col-->
        <div class="col-md-4">
            <div class="card" style="background-color: lightpink;">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 80px;" class="img-fluid rounded-circle"
                             src="/img/categoryicon.jpeg" alt="category_icon">
                    </div>
                    <p>Current Available Categories!!</p>
                    <h2>${categoryCount}</h2> <!-- return count no of category  AdminController-->
                    <h2>Categories</h2>

                </div>
            </div>

        </div>

        <!--third col-->
        <div class="col-md-4">
            <div class="card" style="background-color: lightpink;">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 80px;" class="img-fluid rounded-circle"
                             src="/img/producticon.jpeg" alt="product_icon">
                    </div>
                    <p>Current Available Products!!</p>
                    <h2>${productCount}</h2> <!-- return count no of products  AdminController-->
                    <h2>Products</h2>

                </div>
            </div>
        </div>

    </div>

    <div class="row my-1 py-1">

        <!--first col-->
        <div class="col-md-4">
            <div class="card" style="background-color: lightskyblue;" data-toggle="modal"
                 data-target="#add_category_modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 80px;" class="img-fluid rounded-circle"
                             src="/img/AddcategoryIcon.jpeg" alt="Add_category_icon">
                    </div>
                    <p>Click here to add category!!</p>
                    <h2>Add Category</h2>

                </div>
            </div>

        </div>

        <!--second col-->
        <div class="col-md-4">
            <div class="card" style="background-color: lightskyblue;" data-toggle="modal"
                 data-target="#add_product_modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 80px;" class="img-fluid rounded-circle"
                             src="/img/AddProductIcon.jpeg" alt="Add_Product_icon">
                    </div>
                    <p>Click here to add product!!</p>
                    <h2>Add Product</h2>

                </div>
            </div>

        </div>

        <!--third col-->
        <div class="col-md-4">
            <div class="card" style="background-color: lightskyblue;" data-toggle="modal"
                 data-target="#remove_product_modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 80px;" class="img-fluid rounded-circle"
                             src="/img/RemoveProductIcon.jpeg" alt="Remove_product_icon">
                    </div>
                    <p>Click here to remove product!!</p>
                    <h2>Remove Product</h2>

                </div>
            </div>
        </div>

    </div>

    <div class="row my-0 py-0">

        <!-- first col -->
        <div class="col-md-6">

            <div class="card"
                 style="background-color: #2596BE;"
                 data-toggle="modal"
                 data-target="#remove_category_modal">

                <div class="card-body text-center p-2">

                    <div class="container">
                        <img style="max-width: 60px;"
                             class="img-fluid rounded-circle"
                             src="/img/RemoveCategoryIcon.jpeg"
                             alt="Remove_category_icon">
                    </div>

                    <p class="mb-1">Click here to remove category!!</p>
                    <h5 class="mb-0">Remove Category</h5>

                </div>

            </div>

        </div>


        <!--View Products To Edit and Delete from admin page-->



        <div class="col-md-6 ms-auto">

            <div onclick="window.location='/view_products'" class="card" style="background-color: lightpink;">

                <div class="card-body text-center p-2">

                    <div class="container">
                        <img style="max-width: 60px;"
                             class="img-fluid rounded-circle"
                             src="/img/viewIcon.png"
                             alt="View_icon">
                    </div>

                    <p class="mb-1">Click here to view/update Products!!</p>

                    <h5 class="mb-0">View Products</h5>

                </div>

            </div>

        </div>


        <!--End-->

    </div>
</div>
<!--To show pie chart in Admin -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="card shadow-lg border-0"
                 style="
                      background: linear-gradient(135deg,#f8fafc,#e2e8f0);
                        border-radius:20px;">
                <div class="card-body">

                    <div id="chartContainer">
                        <canvas id="pieChart"></canvas>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
<!--To show Low stock Product chart in Admin -->
<div class="container mt-5">
    <div class="row justify-content-center">

        <div class="col-md-10">

            <div class="card shadow">

                <div class="card-body p-4">

                    <h3 class="text-center mb-4">
                        Low Stock Products
                    </h3>

                    <canvas id="lowStockChart"></canvas>

                </div>

            </div>

        </div>

    </div>
</div>

    <canvas id="lowStockChart"></canvas>

</div>

<!-- Add category modal-->

<div class="modal fade" id="add_category_modal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details!!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="/admin/add-category" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="categoryTitle"
                               placeholder="Enter category title here" required/>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control"
                                  placeholder="Enter category description"
                                  name="categoryDescription" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-success"
                                style="border: 3px solid black;">Add
                        </button>

                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!--End-->

<!--Add Product-->
<div class="modal fade" id="add_product_modal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Add Product Details!!</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="/admin/add-product" method="post"
                      enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="pName"
                               placeholder="Enter Product Name here" required/>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="pPrice"
                               placeholder="Enter Product Price here in rupees" required/>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="pDiscount"
                               placeholder="Enter Product Discount in percentage"/>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="pQuantity"
                               placeholder="Enter Product Quantity in numbers" required/>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="categoryId"
                               placeholder="Enter category id" required/>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control"
                                  placeholder="Enter product description"
                                  name="pDesc" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="pPhoto">Select only img of the product, And must be less than 2MB!</label>
                        <br>
                        <input type="file" id="pPhoto" class="form-control"
                               name="pPhoto" accept="image/*" required/>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-success"
                                style="border: 3px solid black;">Add
                        </button>

                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<!--End-->

<!--Remove Product-->

<div class="modal fade" id="remove_product_modal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Fill Details To Remove Product!!</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="/admin/delete-product" method="post">
                    <div class="form-group">
                        <input type="number" class="form-control" name="pId"
                               placeholder="Enter product id here" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="pName"
                               placeholder="Enter product Name here" required/>
                    </div>
                    <div class="form-group">
                        <label class="text" style="color:red;">Are you sure, you want to remove this product?</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-success"
                                style="border: 3px solid black;">Remove
                        </button>

                    </div>

                </form>
            </div>

        </div>
    </div>
</div>

<!--End-->
<!-- Remove Category-->
<div class="modal fade" id="remove_category_modal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Fill Details To Remove Category!!</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="/admin/delete-category" method="post">
                    <div class="form-group">
                        <input type="number" class="form-control"
                               name="categoryId"
                               placeholder="Enter category id here" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control"
                               name="categoryTitle"
                               placeholder="Enter category Title here" required/>
                    </div>
                    <div class="form-group">
                        <label class="text" style="color:red;">Are you sure, you want to remove this category?</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-success"
                                style="border: 3px solid black;">Remove
                        </button>

                    </div>

                </form>
            </div>

        </div>
    </div>
</div>
<!--End-->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
<script>
    window.onload = function () {

        fetch('/admin/chart-data')
            .then(response => response.json())
            .then(data => {

                const ctx =
                    document.getElementById('pieChart')
                        .getContext('2d');

                new Chart(ctx, {

                    type: 'pie',

                    data: {

                        labels: data.labels,

                        datasets: [{
                            data: data.values
                        }]
                    },

                    options: {

                        responsive: true,

                        maintainAspectRatio: false,

                        plugins: {

                            title: {
                                display: true,
                                text: 'Products By Category',
                                font: {
                                    size: 24,
                                    weight: 'bold'
                                }
                            },

                            legend: {
                                position: 'bottom',

                                labels: {
                                    font: {
                                        size: 16,
                                        weight: 'bold'
                                    },
                                    color: 'black'
                                }
                            },

                            datalabels: {

                                color: 'white',

                                font: {
                                    size: 14,
                                    weight: 'bold'
                                },

                                formatter: (value, context) => {

                                    let dataArr =
                                        context.chart.data.datasets[0].data;

                                    let total =
                                        dataArr.reduce((a,b) => a+b,0);

                                    let percentage =
                                        ((value/total)*100).toFixed(1);

                                    return percentage + "%";
                                }
                            }
                        }
                    },

                    plugins: [ChartDataLabels]
                });

            });

    }


    fetch('/admin/low-stock-data')

        .then(response => response.json())

        .then(data => {

            const ctx2 =
                document.getElementById('lowStockChart');

            new Chart(ctx2, {

                type: 'bar',

                data: {

                    labels: data.labels,

                    datasets: [{

                        label: 'Stock Left',

                        data: data.values,

                        backgroundColor: [
                            '#ef4444',
                            '#f97316',
                            '#eab308',
                            '#22c55e',
                            '#3b82f6',
                            '#8b5cf6'
                        ],

                        borderRadius: 10,
                        borderWidth: 0
                    }]
                },

                options: {

                    indexAxis: 'y',

                    responsive: true,

                    scales: {

                        x: {
                            beginAtZero: true
                        }
                    },

                    plugins: {

                        legend: {
                            display: false
                        }
                    }
                }
            });

        });

</script>




<jsp:include page="/components/common_modals.jsp" />
</body>
</html>