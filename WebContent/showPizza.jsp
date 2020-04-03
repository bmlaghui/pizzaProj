<%@page import="java.sql.*" %>
<%@page import="pizzapackage.Pizza" %>
<%@page import="pizzapackage.Ingredient" %>
<%@page import="pizzapackage.DbConnect" %>
<%@page import="pizzapackage.PizzaDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 int id = Integer.parseInt(request.getParameter("numPizza"));
Pizza unePizza = PizzaDAO.getPizzaBynumPizza(id);

%>
<jsp:include page="navbar.jsp" />  

<main role="main">
<div class="jumbotron">
    <div class="container">
      <h2 class="display-3">Détails : <strong><%out.print(unePizza.getNomPizza());%></strong></h2>
      <p>
      
      </p>
    </div>
  </div>
 <div class="container">
  <div class="row">
<div class="col">
   <img src="images/<%out.println(unePizza.getNomPizza()); %>.jpg" style="width:100%; height:70%">	
   </div>
   <div class="col">
	 <div class="caption">
		          <p> <h3> <%out.println(unePizza.getNomPizza()); %> </h3> </p>
		          <p> Prix : <kbd><%out.println(unePizza.getPrixPizza()); %> Euros </kbd></p>
		          <p> <%out.println(unePizza.getDescriptionPizza()); %> </p>
		          <p><strong>Ingrédients</strong></p>
		          <ul class="list-group list-group-flush">
		           <% for (Ingredient unIngredient : PizzaDAO.getIngredientsPizza(id))
         {
        	 %>
			
			
  <li class="list-group-item"><% out.print(unIngredient.getNomIngredient()); %></li>
  

<% } %>
</ul>
		        </div>
		        </div>
  
</div> 
</div> 
</main>


</body>
</html>
