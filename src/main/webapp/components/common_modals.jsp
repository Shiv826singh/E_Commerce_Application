

<!-- Modal of cart-->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Your Cart !!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="cart-body"></div>

                <hr>

                <div class="mt-3">

                    <h5>
                        Selected Items :
                        <span id="selected-items">0</span>
                    </h5>

                    <h5 class="text-success">
                        Total Amount :
                        &#8377; <span id="selected-total">0</span>
                    </h5>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button onclick="goToCheckout()"
                        class="btn btn-success btn-lg">

                    Checkout

                </button>
            </div>
        </div>
    </div>
</div>

<div id="toast">This is our custom Toast text</div>
