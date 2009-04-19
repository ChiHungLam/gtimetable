package org.wroc.pwr.gtt.server;

/**
 * Klasa reprezentuj�ca wspo�rz�dne geograficzne, przechowuje d�ugo�c i
 * szereoko�� geograficza; konieczne do wy�wietalnia przyst. na mapie.
 * 
 * @author Micha� Brzezi�ski-Spiczak
 * 
 */
public class Coordinates {
	double dlugosc;
	double szerokosc;

	public Coordinates(double dlugosc, double szerokosc) {

		this.dlugosc = dlugosc;
		this.szerokosc = szerokosc;
	}

	/**
	 * @return the dlugosc
	 */
	public double getDlugosc() {
		return dlugosc;
	}

	/**
	 * @param dlugosc
	 *            the dlugosc to set
	 */
	public void setDlugosc(double dlugosc) {
		this.dlugosc = dlugosc;
	}

	/**
	 * @return the szerokosc
	 */
	public double getSzerokosc() {
		return szerokosc;
	}

	/**
	 * @param szerokosc
	 *            the szerokosc to set
	 */
	public void setSzerokosc(double szerokosc) {
		this.szerokosc = szerokosc;
	}

}
