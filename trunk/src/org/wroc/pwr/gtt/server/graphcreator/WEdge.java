package org.wroc.pwr.gtt.server.graphcreator;

import java.sql.Connection;

import org.jgrapht.graph.DefaultWeightedEdge;
import org.wroc.pwr.gtt.server.DBconnector;

/**
 * Klasa rozszerzaj�ca wazona kraw�d� dodaj�ca etykiety - id lini i typ id oraz
 * druga wag�. Metody zwracaj� this ze wzgl�du na konstrukcje metod z biblioteki
 * jgrapht - dodawanie krawedzie do grafu)
 * 
 * @author Micha� Brzezi�ski-Spiczak
 * 
 */
public class WEdge extends DefaultWeightedEdge {
	int label;
	int waga;
	int typ;
	DBconnector conn;

	public WEdge setLabel(int linia) {
		label = linia;
		return this;
	}

	public WEdge setTyp(int typ) {
		this.typ = typ;
		return this;
	}

	public String toString() {
		if (label != 1)
			return conn.getLiniaNazwa(label) + "(" + conn.getPrzystNazwa((Integer) getSource()) + "," + conn.getPrzystNazwa((Integer) getTarget()) + ")";
		else
			return "";
	}

	public WEdge setWeight(int waga2) {
		waga = waga2;
		return this;
	}

	public WEdge setDB(DBconnector bconnector) {
		this.conn = bconnector;
		return this;
	}
	public Object getSourceVertex(){
		return getSource();
	}
	public Object getTargetVertex(){
		return getTarget();
	}

}
