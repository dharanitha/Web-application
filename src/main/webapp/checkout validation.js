function validation(){
	        var name= document.getElementById("name").value;
	        var email= document.getElementById("email").value;
	        var address= document.getElementById("address").value;
	        var city= document.getElementById("city").value;			
	        var state= document.getElementById("state").value;
	        var pincode=document.getElementById("pincode").value;
	        var cardName= document.getElementById("cardName").value;
	        var cardNumber= document.getElementById("cardNumber").value;
	        var expiryMonth= document.getElementById("expiryMonth").value;
	        var expiryYear= document.getElementById("expiryYear").value;			
	        var cvv= document.getElementById("cvv").value;
	        var letters = /^[A-Za-z]+$/;
	        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	        var pincode=/^([0-9](6,6))+$/;
	        var cardNumber=/^([?:4[0-9]{12}(?:[0-9]{3})?)$/;
	        var cvvnumber=/^([0-9]{3-4})+$/;
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
	        else if(address==''){
		        alert('Please enter your address');
	        }
	        else if(city==''){
		        alert('Please enter your city');
	        }
	        else if(state==''){
		        alert('Please enter your state');
	        }
	        else if(pincode==''){
		        alert('Please enter your pincode');
	        }
	        else if (!pincode.test(pincode)){
		        alert('pincode should be 6 digits');
	        }
	        else if(cardName==''){
		        alert('Please enter your cardname');
	        }
	        else if(cardNumber==''){
		        alert('Please enter your cardnumber');
	        }
	        else if(!cardNumber.test(cardNumber)){
		        alert('Cardnumber should start with 4 followed by 13 or 16 digits');
	        }
	        else if(expiryMonth==''){
		        alert('Please enter your expiry month');
	        }
	        else if(expiryYear==''){
		        alert('Please enter your expiry year');
	        }
	        else if(cvv==''){
		        alert('Please enter your cvv');
	        }
	        else if (!cvvnumber.test(cvv)){
		        alert('cvv number should have 3 digits');
	        }
	        else{
                alert('Thank you for purchasing!!')
	        	window.location.href="thankyou.jsp";
	        }
        }
function checkout(){
	window.location.href="Payment.jsp";
}