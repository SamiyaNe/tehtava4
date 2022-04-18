package model;

public class Asiakas {
	
	
	private String enimi, snimi, sposti;
	private int puhelin;
	public Asiakas() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Asiakas(String enimi, String snimi, String sposti, int puhelin) {
		super();
		this.enimi = enimi;
		this.snimi = snimi;
		this.sposti = sposti;
		this.puhelin = puhelin;
	}
	public String getEnimi() {
		return enimi;
	}
	public void setEnimi(String enimi) {
		this.enimi = enimi;
	}
	public String getSnimi() {
		return snimi;
	}
	public void setSnimi(String snimi) {
		this.snimi = snimi;
	}
	public String getSposti() {
		return sposti;
	}
	public void setSposti(String sposti) {
		this.sposti = sposti;
	}
	public int getPuhelin() {
		return puhelin;
	}
	public void setPuhelin(int puhelin) {
		this.puhelin = puhelin;
	}
	@Override
	public String toString() {
		return "Asiakas [enimi=" + enimi + ", snimi=" + snimi + ", sposti=" + sposti + ", puhelin=" + puhelin + "]";
	}

}
