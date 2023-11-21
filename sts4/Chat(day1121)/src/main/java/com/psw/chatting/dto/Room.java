package com.psw.chatting.dto;

import lombok.Data;

@Data
public class Room {
	
	public int roomNumber;
	public String roomName;
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}	

}
