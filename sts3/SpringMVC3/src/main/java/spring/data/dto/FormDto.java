package spring.data.dto;

import org.springframework.stereotype.Controller;

@Controller
public class FormDto {
	
	private String sang;
	private int price;
	
	public String getSang() {
		return sang;
	}
	public void setSang(String sang) {
		this.sang = sang;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
