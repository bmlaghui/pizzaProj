package pizzapackage;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet; 

public class PizzaDAO {

	     static List<Pizza> listPizza = new ArrayList<Pizza>();
	     static List<Ingredient> listIngredient = new ArrayList<Ingredient>();
	 	
	       static public List<Pizza> getAllPizzas() throws Exception {
	       
	         
	        String sql = "SELECT * FROM pizza";
	         
	       Connection conn = DbConnect.getConnection() ;
	         
	        Statement statement = conn.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        listPizza.clear(); 
	        while (resultSet.next()) {
	            int numPizza = resultSet.getInt("numPizza");
	            String nomPizza = resultSet.getString("nomPizza");	         
	            Float prixPizza = resultSet.getFloat("prixPizza");
	            String descriptionPizza = resultSet.getString("descriptionPizza");	         

	             
	             
	            Pizza itemPizza = new Pizza(numPizza, nomPizza, prixPizza,descriptionPizza);
	            listPizza.add(itemPizza);
	        }
	         
	        resultSet.close();
	        statement.close();
	        conn.close();
	         
	       // itemPizza disconnect();
	         
	        return listPizza;
	    }
	       
	       static public Pizza getPizzaBynumPizza(int pizzanumPizza) throws Exception {
	    	   
	    	   Connection conn = DbConnect.getConnection() ;
		         
		        
	           String query = "select * from pizza where numPizza = " + pizzanumPizza     ;
	           Statement stmt = conn.createStatement();
	           ResultSet res = stmt.executeQuery(query);
	           res.next();
	            int numPizza = res.getInt("numPizza");
	            String nomPizza = res.getString("nomPizza");	         
	            Float prixPizza = res.getFloat("prixPizza");
	            String descriptionPizza = res.getString("descriptionPizza");	  
	             
	            Pizza onePizza = new Pizza(numPizza, nomPizza, prixPizza,descriptionPizza);
	           
	            return onePizza;
	           
	       }
	       public static void  AjouterPizza(String nomPizza, Float prixPizza,String descriptionPizza, String ingredients[]) throws Exception {
	    	   Connection conn = DbConnect.getConnection() ;
          
	           PreparedStatement ps = conn.prepareStatement("insert into pizza(nomPizza,prixPizza,descriptionPizza) values (?,?,?)") ;
	
	           ps.setString(1, nomPizza) ;
	           ps.setFloat(2,  prixPizza) ; 
	           ps.setString(3, descriptionPizza) ;
	           ps.executeUpdate();
	           
	           Statement stmt = conn.createStatement();
	           ResultSet rs=stmt.executeQuery("select * from pizza");
	           if(rs.last()){
	           int numLastPizza=rs.getInt("numPizza");
	           for (String unIngredient : ingredients) {
	        	   PreparedStatement ps2 = conn.prepareStatement("insert into composer(numPizza,numIngredient) values (?,?)") ;
	   	       	
		           ps2.setInt(1, numLastPizza) ;
		           ps2.setString(2,  unIngredient) ; 
		           ps2.executeUpdate();
	        	    }
	           }
	           
	          
	           
	       }
static public List<Ingredient> getIngredientsPizza(int numPizza) throws Exception  {
	    	   
	    	   Connection conn = DbConnect.getConnection() ;
		         
		        
	           String sql = "select i.*,c.* from ingredient i, composer c  where c.numPizza = " + numPizza+" and c.numIngredient=i.numIngredient"     ;
	     
	           Statement statement = conn.createStatement();
		        ResultSet resultSet = statement.executeQuery(sql);
		        listIngredient.clear(); 

		        while (resultSet.next()) {
		            int numIngredient = resultSet.getInt("numIngredient");
		            String nomIngredient = resultSet.getString("nomIngredient");	         

		             
		             
		            Ingredient itemIngredient = new Ingredient(numIngredient, nomIngredient);
		            listIngredient.add(itemIngredient);
		        }
		        return listIngredient;
	
}
public static void  SupprimerPizza(String numPizza) throws Exception {
	Connection conn = DbConnect.getConnection() ;
    PreparedStatement ps = conn.prepareStatement("delete from pizza where numPizza=?") ;
    ps.setString(1, numPizza) ;
    ps.executeUpdate();
   System.out.println(ps);
}
public static void  ModifierPizza(int numPizza,String nomPizza, Float prixPizza,String descriptionPizza, String ingredients[]) throws Exception {
	 Connection conn = DbConnect.getConnection() ;
	 PreparedStatement query = conn.prepareStatement("delete from composer where numPizza=?") ;
	 query.setInt(1,numPizza);
	 query.executeUpdate();
	 
    PreparedStatement ps = conn.prepareStatement("update pizza set nomPizza=?,prixPizza=?,descriptionPizza=? where numPizza=?") ;

    ps.setString(1, nomPizza) ;
    ps.setFloat(2,  prixPizza) ; 
    ps.setString(3, descriptionPizza) ;
    ps.setInt(4, numPizza) ;
    ps.executeUpdate();
    
    Statement stmt = conn.createStatement();
   
    for (String unIngredient : ingredients) {
 	   PreparedStatement ps2 = conn.prepareStatement("insert into composer(numPizza,numIngredient) values (?,?)") ;
       	
        ps2.setInt(1, numPizza) ;
        ps2.setString(2, unIngredient) ; 
        ps2.executeUpdate();
 	    }
    
    

  
    
}
}
