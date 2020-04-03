<%@page import="java.sql.*" %>
<%@page import="pizzapackage.Pizza" %>
<%@page import="pizzapackage.Ingredient" %>
<%@page import="pizzapackage.IngredientDAO" %>
<%@page import="pizzapackage.DbConnect" %>
<%@page import="pizzapackage.PizzaDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="navbar.jsp" />  

<main role="main">
<div class="jumbotron">
    <div class="container">
      <h2 class="display-3">Ajouter une pizza</h2>
      <p>
      
      </p>
    </div>
  </div>
 <div class="container">
  <div class="row">

   <form method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Nom</label>
    <input type="text" class="form-control" placehoder="Entrez le nom" name="nomPizza" required>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Prix</label>
    <input type="text" class="form-control" placehoder="Entrez le prix" name="prixPizza" required>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" placehoder="Entrez la description" name="descriptionPizza" required rows="3"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Ingrédients : </label>
     <% for (Ingredient unIngredient : IngredientDAO.getAllIngredients())
         {
        	 %>
			
 <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="ingredients" value="<% out.println(unIngredient.getNumIngredient()); %>">
  <label class="form-check-label" for="inlineCheckbox1"><% out.println(unIngredient.getNomIngredient()); %>
  </label>
</div>
<% } %>
</div>
 <div class="form-group">
  <button type="submit" class="btn btn-primary">Ajouter</button>
  </div>
</form> 
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
	String nomPizza=request.getParameter("nomPizza");
	String descriptionPizza=request.getParameter("descriptionPizza");
	float prixPizza=Float.parseFloat(request.getParameter("prixPizza"));
	String ingedients[]= request.getParameterValues("ingredients");
	PizzaDAO.AjouterPizza(nomPizza,prixPizza,descriptionPizza,ingedients);
} else {
    // It may be a GET request.
}
%>   
		
	
  
</div> 
</div> 
</main>


</body>
</html>
   
</body>
</html>