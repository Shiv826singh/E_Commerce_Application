/*function add_to_cart(pId, pName, pPrice) {
    let cart = localStorage.getItem("cart");

    if (cart == null) {
        // no cart yet
        let products = [];
        let product = {
            productId: pId,
            productName: pName,
            productQuantity: 1,
            productPrice: pPrice
        };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
    } else {
        // cart is already present
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pId);

        if (oldProduct) {
            // we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1;

            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });

            localStorage.setItem("cart", JSON.stringify(pcart));
        } else {
            // we have to add the product
            let product = {
                productId: pId,
                productName: pName,
                productQuantity: 1,
                productPrice: pPrice
            };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
        }
    }
} */


// ================= ADD TO CART =================

function add_to_cart(pId, pName, pPrice) {

    let cart = localStorage.getItem("cart");

    // cart not present
    if (cart == null) {

        let products = [];

        let product = {
            productId: pId,
            productName: pName,
            productQuantity: 1,
            productPrice: pPrice
        };

        products.push(product);

        localStorage.setItem("cart", JSON.stringify(products));

        // ✅ toast for new item
        showToast(pName + " added to cart");

    } else {

        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find(item => item.productId == pId);

        // product already present
        if (oldProduct) {

            oldProduct.productQuantity += 1;

            // ✅ toast for quantity increase
            showToast(
                oldProduct.productName +
                " quantity increased, Quantity = " +
                oldProduct.productQuantity
            );

        } else {

            // new product
            let product = {
                productId: pId,
                productName: pName,
                productQuantity: 1,
                productPrice: pPrice
            };

            pcart.push(product);

            // ✅ toast for new item
            showToast(pName + " added to cart");
        }

        localStorage.setItem("cart", JSON.stringify(pcart));
    }

    updateCart();
}


// ================= UPDATE CART =================

function updateCart() {

    let cartString = localStorage.getItem("cart");

    let cart = JSON.parse(cartString);

    // cart empty
    if (cart == null || cart.length == 0) {

        $(".cart-items").html("( 0 )");

        $(".cart-body").html(`
            <div class="text-center p-3">
                <h5>Your cart is empty</h5>
            </div>
        `);
        $(".checkout-btn").attr("disabled", true);

    } else {

        $(".cart-items").html(`( ${cart.length} )`);

        let table = `
        <table class='table'>

            <thead class='table-light'>
                <tr>
                    <th>Select</th>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
        `;
        $(".checkout-btn").attr("disabled", false);

        let totalPrice = 0;

        cart.forEach(item => {

            table += `
            <tr>

               <td>
              <input type="checkbox"
               class="checkout-item"
               value="${item.productId}"
               onchange="updateSelectedItems()">
               </td>

               <td>${item.productName}</td>

                <td>₹ ${item.productPrice}</td>

                <td>

                    <button class='btn btn-sm btn-danger'
                    onclick='decreaseQuantity(${item.productId})'>
                        -
                    </button>

                    <span class='mx-2'>
                        ${item.productQuantity}
                    </span>

                    <button class='btn btn-sm btn-success'
                    onclick='increaseQuantity(${item.productId})'>
                        +
                    </button>

                </td>

                <td>
                    ₹ ${item.productQuantity * item.productPrice}
                </td>

                <td>

                    <button class='btn btn-danger btn-sm'
                    onclick='deleteItemFromCart(${item.productId})'>
                        Remove
                    </button>

                </td>

            </tr>
            `;

            totalPrice += item.productQuantity * item.productPrice;
        });

        table += `
            <tr>
                <td colspan='6' class='text-end fw-bold'>
                    Grand Total : ₹ ${totalPrice}
                </td>
            </tr>

            </tbody>
        </table>

      
        `;

        $(".cart-body").html(table);
    }
}



// ================= DELETE ITEM =================

function deleteItemFromCart(pId) {

    let cart = JSON.parse(localStorage.getItem("cart"));

    let newCart = cart.filter(item => item.productId != pId);

    localStorage.setItem("cart", JSON.stringify(newCart));

    updateCart();
    showToast("Item is removed from cart");
}



// ================= INCREASE QUANTITY =================

function increaseQuantity(pId){

    let cart = JSON.parse(localStorage.getItem("cart"));

    cart.map(item => {

        if(item.productId == pId){
            item.productQuantity += 1;
        }

    });

    localStorage.setItem("cart", JSON.stringify(cart));

    updateCart();
}



// ================= DECREASE QUANTITY =================

function decreaseQuantity(pId){

    let cart = JSON.parse(localStorage.getItem("cart"));

    cart.map(item => {

        if(item.productId == pId){

            if(item.productQuantity > 1){
                item.productQuantity -= 1;
            }

        }

    });

    localStorage.setItem("cart", JSON.stringify(cart));

    updateCart();
}



// ================= PAGE LOAD =================

$(document).ready(function () {

    updateCart();

});


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 3000);      //Toast remove after 3 sec, here 3000 ms hai
}


function updateSelectedItems(){

    let cart = JSON.parse(localStorage.getItem("cart"));

    let checkboxes =
        document.querySelectorAll(".checkout-item:checked");

    let total = 0;
    let count = 0;

    checkboxes.forEach(cb => {

        let productId = cb.value;

        let product = cart.find(
            item => item.productId == productId
        );

        if(product){

            total +=
                product.productPrice *
                product.productQuantity;

            count++;
        }

    });

    document.getElementById("selected-items")
        .innerText = count;

    document.getElementById("selected-total")
        .innerText = total;
}


function goToCheckout(){

    let cart = JSON.parse(localStorage.getItem("cart"));

    let checkboxes =
        document.querySelectorAll(".checkout-item:checked");

    let selectedProducts = [];

    checkboxes.forEach(cb => {

        let productId = cb.value;

        let product = cart.find(
            item => item.productId == productId
        );

        if(product){
            selectedProducts.push(product);
        }

    });

    if(selectedProducts.length == 0){

        showToast("Please select at least one item");

        return;
    }

    localStorage.setItem(
        "selectedCart",
        JSON.stringify(selectedProducts)
    );

    window.location.href = "/checkout";
}