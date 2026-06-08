<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>Edit Product</title>

    <jsp:include page="/components/common_css_js.jsp" />

    <style>

        body{
            background: #f4f7fb;
            font-family: 'Segoe UI', sans-serif;
        }

        .edit-card{
            border: none;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .card-header-custom{
            background: linear-gradient(135deg,#0f172a,#1e293b);
            color: white;
            padding: 25px;
        }

        .card-header-custom h2{
            font-weight: 700;
            margin: 0;
        }

        .form-control{
            border-radius: 12px;
            height: 48px;
        }

        textarea.form-control{
            height: 120px;
        }

        .btn-custom{
            border-radius: 12px;
            padding: 10px 25px;
            font-weight: 600;
        }

        .msg-box{
            border-radius: 12px;
            padding: 12px 18px;
            margin-bottom: 20px;
            font-weight: 600;
        }



    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp" />

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <!-- MESSAGE -->

            <%
                String msg = (String) session.getAttribute("msg");

                if(msg != null){
            %>

            <div class="alert alert-info msg-box">

                <%= msg %>

            </div>

            <%
                    session.removeAttribute("msg");
                }
            %>

            <div class="card edit-card">

                <!-- HEADER -->

                <div class="card-header-custom d-flex justify-content-between align-items-center">

                    <h2 class="mb-0">
                        <i class="fa fa-edit"></i>
                        Edit Product
                    </h2>

                    <a href="/view_products"
                       class="btn btn-light">

                        <i class="fa fa-arrow-left"></i>
                        Back

                    </a>

                </div>

                <!-- BODY -->

                <div class="card-body p-4">

                    <form action="/admin/update-product"
                          method="post">

                        <input type="hidden"
                               name="pId"
                               value="${product.pId}">

                        <!-- PRODUCT NAME -->

                        <div class="form-group mb-3">

                            <label class="font-weight-bold">
                                Product Name
                            </label>

                            <input type="text"
                                   name="pName"
                                   value="${product.pName}"
                                   class="form-control"
                                   required>

                        </div>

                        <!-- PRICE -->

                        <div class="row">

                            <div class="col-md-6">

                                <div class="form-group mb-3">

                                    <label class="font-weight-bold">
                                        Price
                                    </label>

                                    <input type="number"
                                           name="pPrice"
                                           value="${product.pPrice}"
                                           class="form-control"
                                           required>

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="form-group mb-3">

                                    <label class="font-weight-bold">
                                        Discount %
                                    </label>

                                    <input type="number"
                                           name="pDiscount"
                                           value="${product.pDiscount}"
                                           class="form-control">

                                </div>

                            </div>

                        </div>

                        <!-- QUANTITY -->

                        <div class="form-group mb-3">

                            <label class="font-weight-bold">
                                Quantity
                            </label>

                            <input type="number"
                                   name="pQuantity"
                                   value="${product.pQuantity}"
                                   class="form-control"
                                   required>

                        </div>

                        <!-- DESCRIPTION -->

                        <div class="form-group mb-3">

                            <label class="font-weight-bold">
                                Description
                            </label>

                            <textarea name="pDesc"
                                      class="form-control"
                                      required>${product.pDesc}</textarea>

                        </div>

                        <!-- CATEGORY -->

                        <div class="form-group mb-4">

                            <label class="font-weight-bold">
                                Category ID
                            </label>

                            <input type="number"
                                   name="categoryId"
                                   value="${product.categ.categoryId}"
                                   class="form-control"
                                   required>

                        </div>

                        <!-- BUTTONS -->

                        <div class="d-flex justify-content-between">

                            <a href="/view_products"
                               class="btn btn-secondary btn-custom">

                                Cancel

                            </a>

                            <button type="submit"
                                    class="btn btn-success btn-custom">

                                <i class="fa fa-save"></i>
                                Update Product

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>