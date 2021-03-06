

<%@page import="productrestservice.service.ProductService"%>
<%@page import="productrestservice.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JNAH</title>
        <link rel="stylesheet" href="form.css" />
        <link rel="stylesheet" href="main.css" />
        <link rel="icon" href="picture/logo-JNAH.PNG">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Building a dynamic website using HTML, JavaScript, and CSS">
        <meta name="author" content="Jonathan Tran, Nina Vuong, Anh Nguyen, Huy Luong">
    </head>
    <body style="text-align: left;">
         <!-- NAVBAR -->
         <nav id="main-nav">
            <div class="row">
                <div class="container">
                    <div class="logo">
                        <a href="home.html"><img src="picture/logo.PNG" alt="logo"></a>
                    </div>

                    <ul class="nav-menu" style="list-style-type:none;" id="navbar">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="home.jsp#products">Products</a></li>
                        <% 
                            List<String> quantityList = new ArrayList<String>();
                            if (session.getAttribute("nameList") != null){
                                quantityList = (List<String>)session.getAttribute("quantityList");
                                int total = 0;
                                for (int i = 0; i < quantityList.size(); i++) {
                                    total += Integer.parseInt(quantityList.get(i));
                                }
                        %>
                        <li><a href="form.jsp">Cart <sup>+<%=total%></sup></a></li>
                        <%    } else {
                        %>
                            <li><a href="form.jsp">Cart</a></li>
                        <%    };
                        %>
                        <li><a href="home.jsp#about-us">About Us</a></li>
                        <li><a href="home.jsp#contact-us">Contact Us</a></li>
                        <li> <a href="javascript:void(0);" class="nav-icon" onclick="navbar()">
                            <i class="fa fa-bars"></i> </a></li>
                    </ul>
                </div>
            </div>
            <div id="toggle" class="toggle-menu" style="list-style-type:none;">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="home.jsp#products">Products</a></li>
                <li><a href="cart.jsp">Order</a></li>
                <li><a href="home.jsp#about-us">About Us</a></li>
                <li><a href="home.jsp#contact-us">Contact Us</a></li>
            </div>
        </nav>

        <!-- ORDER FORM -->
        <div class="container wrapper" style="text-align: left;">
            <div class="row">
                    <div class="card col-12" id="sumary">
                        <div class="card-title">
                            <h2>Sumary</h2>
                            <p><strong>Items added: </strong><span id="itemName"></span></p>
                            <% 
                                List<String> productIdList = new ArrayList<String>();
                                List<String> nameList = new ArrayList<String>();
                                productIdList = (List<String>)session.getAttribute("idList");
                                quantityList = (List<String>)session.getAttribute("quantityList");
                                nameList = (List<String>)session.getAttribute("nameList");
                                for (int i = 0; i < nameList.size(); i++) {
                                    Product p = ProductService.getProductById(Integer.parseInt(productIdList.get(i)));
                            %>
                                    <p><%=i+1%>/<%=p.getName()%> ($<%=p.getPrice()%>)-------- <%=quantityList.get(i)%> items </p>
                            <%    };
                            %>
                            <p><strong>Shipping: </strong><span id="shippingMethod"></span></p>
                            <p><strong>Tax: </strong><span id="tax"></span></p>
                            <p><strong>Total: </strong><span id="total"></span></p>
                        </div>
                    </div>
            </div>
        </div>


        <div class="container">
        <div class="row form-container">
            <div class="col-10 title">
                <h2>Order Form</h2>
            
                <form class="form" id="form">
                    <div class="row">
                        <div class="col-12 form-control">
                            <label for="firstName">First Name</label>
                            <input id="firstName" type="text" placeholder="Your first name" name="firstName">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>
                        <div class="col-12 form-control">
                            <label for="lastName">Last Name</label>
                            <input id="lastName" type="text" placeholder="Your last name" name="lastName">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>  
                        <div class="col-12 form-control">
                            <label for="phone">Phone Number</label>
                            <input id="phone" type="number" placeholder="xxx-xxx-xxxx" name="phone">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>
                        <div class="col-12 form-control">
                            <label for="email">Email</label>
                            <input id="email" type="text" placeholder="abc@abc.com" name="email">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>
                        <div class="col-12 form-control">
                            <label for="address">Shipping Address</label>
                            <input id="address" type="text" placeholder="Ex: 123 Bison Ave" name="address">
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>
                        <div class="col-6 form-control">
                            <label for="city">City</label>
                            <input id="city" type="text" placeholder="Type in zipcode to get info" name="city" disabled>
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>
                        <div class="col-6 form-control">
                            <label for="state">State</label>
                            <input id="state" type="text" placeholder="Type in zipcode to get info" name="state" disabled>
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error message</small>
                        </div>
                        <div class="col-6 form-control">
                            <label for="zipcode">Zip Code</label>
                            <input id="zipcode" type="number" placeholder="Ex: 92626" name="zipcode"> 
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small >Error message</small>
                            <div id='zipcode-error'></div>
                        </div>                        
                        <div class="col-6 form-control" id="zipcode-button" onmouseover="getInfoFromZipcode()">Get info from zip code</div>
                        <div class="col-12 form-control">
                            <label>Shipping Method</label>
                            <div class="option">
                                <select id="option" class="shipping-option" onchange="getShippingPrice()">
                                    <option value="5">6 Days Ground - $5</option>
                                    <option value="10">2 Days Expedited - $10</option>
                                    <option value="30">Overnight - $30</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <br><br><hr><br><br>
                    <div class="card-info">
                        <h2>Card Infomation</h2>
                        <div class="row">
                            <div class="col-12 form-control">
                                <label for="nameOnCard">Name On Card</label>
                                <input id="nameOnCard" type="text" placeholder="Full Name Displayed on the Card" name="nameOnCard">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <small>Error message</small>
                            </div>
                            <div class="col-12 form-control">
                                <label for="cardNo">Card Number</label>
                                <input id="cardNo" type="number" placeholder="Ex: 9999 9999 9999 9999" name="cardNo">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <small>Error message</small>
                            </div>
                            <div class="col-4 form-control">
                                <label for="exp">Expiration Date</label>
                                <input id="exp" type="text" placeholder="mm/yy" pattern="(0[1-9]|1[0-2])/(2[0-9]|3[0-9])" name="cardNo">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <small>Error message</small>
                            </div>
                            <div class="col-3 form-control">
                                <label for="cvv">CVV</label>
                                <input id="cvv" type="number" placeholder="Ex: 123" name="cvv">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <small>Error message</small>
                            </div>
                        </div>
                    </div>
                    <div class="form-button col-12">
                        <button id="submit-button" type="submit" >Submit</button>
                    </div>
                </form>
            </div>
        </div>  
        </div>

        

        <!-- JavaScript -->
        <script src="https://kit.fontawesome.com/3a7f96f49f.js" crossorigin="anonymous"></script>
        <script src="js/form.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

