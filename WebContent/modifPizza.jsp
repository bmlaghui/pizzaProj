<%@page import="java.sql.*" %>
<%@page import="pizzapackage.Pizza" %>
<%@page import="pizzapackage.Ingredient" %>
<%@page import="pizzapackage.IngredientDAO" %>
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
      <h2 class="display-3">Modifier <strong><%out.print(unePizza.getNomPizza());%></strong></h2>
      <p>
      
      </p>
    </div>
  </div>
 <div class="container">
  <div class="row">

   <form method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Nom</label>
    <input type="text" class="form-control" name="nomPizza" value="<%out.print(unePizza.getNomPizza());%>" required>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Prix</label>
    <input type="text" class="form-control" name="prixPizza" value="<%out.print(unePizza.getPrixPizza());%>" required>
  </div>
 
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" placehoder="Entrez la description" name="descriptionPizza" required rows="3"><%out.print(unePizza.getDescriptionPizza());%></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Ingrédients : </label>
     <% 
    	 for (Ingredient unIngrdient : IngredientDAO.getAllIngredients())
         {
    		 
         				 
    				 %>
    				 <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="ingredients" value="<% out.println(unIngrdient.getNumIngredient()); %>"
   <% System.out.println("checked");
		  for (Ingredient unIngr : PizzaDAO.getIngredientsPizza(id))
          {
 			
  if(unIngr.getNumIngredient() == unIngrdient.getNumIngredient())
	 out.println("checked");
  }%> /> 
  <label class="form-check-label" for="inlineCheckbox1"><% out.println(unIngrdient.getNomIngredient()); %>
  </label>
</div>
    				 <%
    			 }
     
     if ("POST".equalsIgnoreCase(request.getMethod())) {
    	 String nomPizza=request.getParameter("nomPizza");
    		String descriptionPizza=request.getParameter("descriptionPizza");
    		float prixPizza=Float.parseFloat(request.getParameter("prixPizza"));
    		String ingedients[]= request.getParameterValues("ingredients");
     	PizzaDAO.ModifierPizza(unePizza.getNumPizza(),nomPizza,prixPizza,descriptionPizza,ingedients);
     } else {
         // It may be a GET request.
     }
 
    			 %>
    			 
</div>
 <div class="form-group">
  <button type="submit" class="btn btn-primary">Modifier</button>
  </div>
</form>  
		
	
  
</div> 
</div> 
</main>


</body>
</html>