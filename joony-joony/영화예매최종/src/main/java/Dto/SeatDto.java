package Dto;

public class SeatDto {
   
   private String seat_no;
   private String rev_no;
   private int adultCnt;
   private int teenCnt;
   private int childCnt;
   private String seat_name;
   private int totalPrice;
   
   public String getSeat_no() {
      return seat_no;
   }
   public void setSeat_no(String seat_no) {
      this.seat_no = seat_no;
   }
   public String getRev_no() {
      return rev_no;
   }
   public void setRev_no(String rev_no) {
      this.rev_no = rev_no;
   }
   public int getAdultCnt() {
      return adultCnt;
   }
   public void setAdultCnt(int adultCnt) {
      this.adultCnt = adultCnt;
   }
   public int getTeenCnt() {
      return teenCnt;
   }
   public void setTeenCnt(int teenCnt) {
      this.teenCnt = teenCnt;
   }
   public int getChildCnt() {
      return childCnt;
   }
   public void setChildCnt(int childCnt) {
      this.childCnt = childCnt;
   }
   public String getSeat_name() {
      return seat_name;
   }
   public void setSeat_name(String seat_name) {
      this.seat_name = seat_name;
   }
   public int getTotalPrice() {
      return totalPrice;
   }
   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }
   
   
}