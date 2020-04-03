package pizzapackage;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet; 

public class IngredientDAO {

	     static List<Ingredient> listIngredient = new ArrayList<Ingredient>();
	 	
	       static public List<Ingredient> getAllIngredients() throws Exception {
	       
	         
	        String sql = "SELECT * FROM ingredient";
	         
	       Connection conn = DbConnect.getConnection() ;
	         
	        Statement statement = conn.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        listIngredient.clear();
	        while (resultSet.next()) {
	            int numIngredient = resultSet.getInt("numIngredient");
	            String nomIngredient = resultSet.getString("nomIngredient");	         
	            Ingredient itemIngredient = new Ingredient(numIngredient, nomIngredient);
	            listIngredient.add(itemIngredient);
	        }
	         
	        resultSet.close();
	        statement.close();
	        conn.close();
	         
	       // itemIngredient disconnect();
	         
	        return listIngredient;
	    }
	       
	       static public Ingredient getIngredientBynumIngredient(int pizzanumIngredient) throws Exception {
	    	   
	    	   Connection conn = DbConnect.getConnection() ;
		         
		        
	           String query = "select * from pizza where numIngredient = " + pizzanumIngredient     ;
	           Statement stmt = conn.createStatement();
	           
	           ResultSet res = stmt.executeQuery(query);
	           res.next();
	            int numIngredient = res.getInt("numIngredient");
	            String nomIngredient = res.getString("nomIngredient");	         
	             
	            
	            Ingredient oneIngredient = new Ingredient(numIngredient, nomIngredient);
	           
	            return oneIngredient;
	           
	       }
	       public static void  AjouterIngredient(String nomIngredient, Float prixIngredient) throws Exception {
	    	   Connection conn = DbConnect.getConnection() ;
		         
		        
	          // Statement stmt = conn.createStatement();
	           
	           //stmt.executeUpdate("insert into pizza(nomIngredient,prixIngredient) values (" + nomIngredient +","+ prixIngredient+")") ;
	          
	           PreparedStatement ps = conn.prepareStatement("insert into pizza(nomIngredient,prixIngredient) values (?,?)") ;
	
	           ps.setString(1, nomIngredient) ;
	           ps.setFloat(2,  prixIngredient) ; 
	           ps.executeUpdate();
	           
	       }

	
}
