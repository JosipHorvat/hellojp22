package zadaca;

import javax.swing.JOptionPane;

public class Zadatci {

	public static void main(String[] args) {

		//Korisnik unosi 5 ocjena, program ispisuje njihov prosjek
		
		/*
		float prvaOcjena = Integer.parseInt(JOptionPane.showInputDialog("Upisi prvu ocjenu:"));
		float drugaOcjena =Integer.parseInt(JOptionPane.showInputDialog("Upisi drugu ocjenu:"));
		float trecaOcjena =Integer.parseInt(JOptionPane.showInputDialog("Upisi trecu ocjenu:"));
		float cetvrtaOcjena = Integer.parseInt(JOptionPane.showInputDialog("Upisi cetvrtu ocjenu:"));
		float petaOcjena = Integer.parseInt(JOptionPane.showInputDialog("Upisi petu ocjenu:"));
		float prosjek = (prvaOcjena+drugaOcjena+trecaOcjena+cetvrtaOcjena+petaOcjena)/5;
		System.out.printf("Vas prosjek ocjena je ", prosjek);
		*/
	
	    //Z05
				//U programu omogućite unos dva broja, broj sati i minuta. 
				//Ispišite koliko taj broj sati i minuta iznosi u sekundama.
		/*
		int brojSati = Integer.parseInt(JOptionPane.showInputDialog("unesite broj sati:"));
		int brojMinuta = Integer.parseInt(JOptionPane.showInputDialog("Unesite broj minuta:"));
		int rezultat = (brojMinuta * 60) + (brojSati * 3600 );
		System.out.printf("Ukupno sekundi: "+ rezultat);
		*/
		//Z06
				// Program unosi 3 dvoznmenkasta broja. 
		/*		// Ispisuje zbroj vodećih znamenki
		int prviBroj = Integer.parseInt(JOptionPane.showInputDialog("Unesite prvi broj"));
		int drugiBroj =Integer.parseInt(JOptionPane.showInputDialog("Unesite drugi broj:"));
		int treciBroj = Integer.parseInt(JOptionPane.showInputDialog("Unesite treci broj:"));
		float prviUnos = prviBroj/10;
		float drugiUnos = drugiBroj/10;
		float treciUnos = treciBroj/10;
		float ZbrojVodZnamenki = prviUnos+drugiUnos+treciUnos;
		
		System.out.println(ZbrojVodZnamenki);
		*/

		//Z04
				// Za uneseni troznamenkasti broj program ispisuje zadnju 
				// znamenku. Primjer: ulaz 237, izlaz 7, ulaz 333 izlaz 3
				int troZnmBroj =Integer.parseInt(JOptionPane.showInputDialog("Unesite broj sa 3 znamenke:"));
				int rjesenje = troZnmBroj%10;
				
				System.out.println(rjesenje);
				
				
	}

}
