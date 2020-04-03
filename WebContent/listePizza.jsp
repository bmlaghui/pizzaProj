<%@page import="java.sql.*" %>
<%@page import="pizzapackage.Pizza" %>
<%@page import="pizzapackage.DbConnect" %>
<%@page import="pizzapackage.PizzaDAO" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="navbar.jsp" />  

<main role="main">
<div class="jumbotron">
    <div class="container">
      <h1 class="display-3">Nos pizzas!</h1>
      <a class="btn btn-primary" href="addPizza.jsp">Ajouter</a>
      <p>
      
      </p>
    </div>
  </div>
 <div class="container">
  <div class="row">

         <% for (Pizza unePizza : PizzaDAO.getAllPizzas())
         {
        	 %>
			
			<div class="col-md-4 col-sm-6 col-xs-10">
		      <div class="thumbnail" >
		          <a href="showPizza.jsp?numPizza=<% out.println(unePizza.getNumPizza()); %>"><img src="images/<%out.println(unePizza.getNomPizza()); %>.jpg" class="zoom" alt="<%out.println(unePizza.getNomPizza()); %>" style="width:100%; height:70%"></a>
		          <div class="caption" style="text-align: center;">
		          <p> <b>Pizza: <a href="showPizza.jsp?numPizza=<% out.println(unePizza.getNumPizza()); %>"><%out.println(unePizza.getNomPizza()); %></a> </b> </p>
		          <p> Prix : <kbd><%out.println(unePizza.getPrixPizza()); %> Euros</kbd> </p>
		          <p style="text-align: left;"> <% out.println(unePizza.getDescriptionPizza());   %> </p>
		        </div>
		        <a class="btn btn-primary" style="position: relative;" href="modifPizza.jsp?numPizza=<% out.println(unePizza.getNumPizza()); %>">Modifier</a>
		      		        <a class="btn btn-info" style="position: relative;" href="showPizza.jsp?numPizza=<% out.println(unePizza.getNumPizza()); %>">Détails</a>
		      
		       <form method="POST">
				<input  type="submit" style="position: relative;" class="btn btn-danger" style="position: relative" value="Supprimer" />
				<input  type="hidden" style="position: relative;" class="btn btn-danger" name="numPizza" value="<% out.print(unePizza.getNumPizza()); %>" />
				</form>
				<% 
if ("POST".equalsIgnoreCase(request.getMethod())) {
	 String id = request.getParameter("numPizza");

	 PizzaDAO.SupprimerPizza(id);
	
} else {
    // It may be a GET request.
}
%> 
		      </div>
		     <p style="border-bottom:3px solid black; position: relative; top: -20px;"></p>
		    </div>
<% } %>
		
	</div>
  
</div>  
</main>


</body>
</html>
   
</body>
</html>