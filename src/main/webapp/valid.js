function validation(){
            var name= document.getElementById("name").value;
	        var email= document.getElementById("email").value;
	        var password= document.getElementById("password").value;			
	        var repassword= document.getElementById("re-password").value;
            var phonenumber=document.getElementById("phonenumber").value;
	        var password_expression = /^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-])/;
	        var letters = /^[A-Za-z]+$/;
	        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var number= /^[0-9][0-9]{9}$/;
            if(name==''){
                alert('Please enter your name');
            }
	        else if(!letters.test(name)){
                alert('Name field required only alphabet characters');
	        }
	        else if(email==''){
		        alert('Please enter your user email id');
	        }
	        else if (!filter.test(email)){
		        alert('Invalid email');
	        }
            else if(password==''){
		        alert('Please enter Password');
            }
	        else if(repassword==''){
                alert('Enter Confirm Password');
            }
            else if(!password_expression.test(password)){
                alert ('Upper case, Lower case, Special character and Numeric letter are required in Password filed');
            }
            else if(password != repassword){
                alert ('Password not Matched');
            }
            else if(document.getElementById("re-password").value.length <= 4){
                alert ('Password minimum length is 4');
            }
            else if(document.getElementById("re-password").value.length >= 11){
                alert ('Password max length is 11');
            }
            else if(phonenumber==''){
                alert('Enter Phone number');
            }
            else if(!number.test(phonenumber)){
                alert('Phone Number should have 10 digits number')
            }
            else{			 
                alert('Thank You for creating a account');
            }
        }
        
function loginvalidation(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var letters = /^[A-Za-z]+$/;
	var password_expression = /^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-])/;
	if(username ==''){
		alert("please enter user name.");
	}
	else if(password==''){
		alert("enter the password");
	}
	else if(!letters.test(username)){
		alert("Enter valid username id.");
	}
	else if(password.length <=6 || password.length >=11){
		alert("Password min and max length is 6.");
	}
	else if(!password_expression.test(password)){
		alert ('Upper case, Lower case, Special character and Numeric letter are required in Password filed');
	}
	else{
		alert('Thank You for Login');
	}
}

function checkout(){
	window.location.href="Order.jsp";
}
if (document.readyState == 'loading') {
                document.addEventListener('DOMContentLoaded', ready)
            } else {
                ready()
            }
            function ready() {
                var removeCartItemButtons = document.getElementsByClassName('btn-danger')
                for (var i = 0; i < removeCartItemButtons.length; i++) {
                    var button = removeCartItemButtons[i]
                    button.addEventListener('click', removeCartItem)
                }
                var quantityInputs = document.getElementsByClassName('cart-quantity-input')
                for (var i = 0; i < quantityInputs.length; i++) {
                    var input = quantityInputs[i]
                    input.addEventListener('change', quantityChanged)
                }
                var addToCartButtons = document.getElementsByClassName('shop-item-button')
                for (var i = 0; i < addToCartButtons.length; i++) {
                    var button = addToCartButtons[i]
                    button.addEventListener('click', addToCartClicked)
                }
                document.getElementsByClassName('btn-purchase')[0].addEventListener('click', purchaseClicked)
            }
            function purchaseClicked() {
                alert('Checkout page is opening!')
                var cartItems = document.getElementsByClassName('cart-items')[0]
                while (cartItems.hasChildNodes()) {
                    cartItems.removeChild(cartItems.firstChild)
                }
                updateCartTotal()
            }
            function removeCartItem(event) {
                var buttonClicked = event.target
                buttonClicked.parentElement.parentElement.remove()
                updateCartTotal()
            }
            function quantityChanged(event) {
                var input = event.target
                if (isNaN(input.value) || input.value <= 0) {
                    input.value = 1
                }
                updateCartTotal()
            }
            function addToCartClicked(event) {
                var button = event.target
                var shopItem = button.parentElement.parentElement
                var title = shopItem.getElementsByClassName('shop-item-title')[0].innerText
                var price = shopItem.getElementsByClassName('shop-item-price')[0].innerText
                var imageSrc = shopItem.getElementsByClassName('shop-item-image')[0].src
                addItemToCart(title, price, imageSrc)
                updateCartTotal()
            }
            function addItemToCart(title, price, imageSrc) {
                var cartRow = document.createElement('div')
                cartRow.classList.add('cart-row')
                var cartItems = document.getElementsByClassName('cart-items')[0]
                var cartItemNames = cartItems.getElementsByClassName('cart-item-title')
                for (var i = 0; i < cartItemNames.length; i++) {
                    if (cartItemNames[i].innerText == title) {
                        alert('This item is already added to the cart')
                        return
                    }
                }
                var cartRowContents = `
                    <div class="cart-item cart-column">
                        <img class="cart-item-image" src="${imageSrc}" width="100" height="100">
                        <span class="cart-item-title">${title}</span>
                    </div>
                    <span class="cart-price cart-column">${price}</span>
                    <div class="cart-quantity cart-column">
                        <input class="cart-quantity-input" type="number" value="1">
                        <button class="btn btn-danger" type="button">REMOVE</button>
                    </div>`
                cartRow.innerHTML = cartRowContents
                cartItems.append(cartRow)
                cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', removeCartItem)
                cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', quantityChanged)
            }
            function updateCartTotal() {
                var cartItemContainer = document.getElementsByClassName('cart-items')[0]
                var cartRows = cartItemContainer.getElementsByClassName('cart-row')
                var total = 0
                for (var i = 0; i < cartRows.length; i++) {
                    var cartRow = cartRows[i]
                    var priceElement = cartRow.getElementsByClassName('cart-price')[0]
                    var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
                    var price = parseFloat(priceElement.innerText.replace('Rs.', ''))
                    var quantity = quantityElement.value
                    total = total + (price * quantity)
                }
                total = Math.round(total * 100) / 100
                document.getElementsByClassName('cart-total-price')[0].innerText = 'Rs.' + total
            }
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }
            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
            function openBar(){
            	document.getElementById("menu-bar").style.display = "block";
            }
            function closeBar(){
            	document.getElementById("menu-bar").style.display = "block";
            }
            
            function cart(){
                var modal = document.getElementById("cartModel");
                var btn = document.getElementById("cartBtn");
                var span = document.getElementsByClassName("cart-close")[0];
                btn.onclick = function() {
                    modal.style.display = "block";
                }
                span.onclick = function() {
                    modal.style.display = "none";
                }
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            }
            function logout(){
                var modal = document.getElementById("modal-logout");
                var btn = document.getElementById("myBtn");
                var span = document.getElementsByClassName("close-logout")[0];
                btn.onclick = function() {
                    modal.style.display = "block";
                }
                span.onclick = function() {
                    modal.style.display = "none";
                }
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            }