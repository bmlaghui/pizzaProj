package pizzapackage;

public class Pizza {
	
public Pizza(int numPizza, String nomPizza, float prixPizza, String descriptionPizza) {
		super();
		this.nomPizza = nomPizza;
		this.numPizza = numPizza;
		this.prixPizza = prixPizza;
		this.descriptionPizza = descriptionPizza;
	}

String nomPizza;
int numPizza;
float prixPizza;
String descriptionPizza;


public String getNomPizza() {
	return nomPizza;
}
public void setNomPizza(String nomPizza) {
	this.nomPizza = nomPizza;
}
public int getNumPizza() {
	return numPizza;
}
public void setNumPizza(int numPizza) {
	this.numPizza = numPizza;
}
public float getPrixPizza() {
	return prixPizza;
}
public void setPrixPizza(float prixPizza) {
	this.prixPizza = prixPizza;
}
public String getDescriptionPizza() {
	return descriptionPizza;
}
public void setDescriptionPizza(String descriptionPizza) {
	this.descriptionPizza = descriptionPizza;
}

public static void main(String[] args) {
	// TODO Auto-generated method stub

}	

}


	


