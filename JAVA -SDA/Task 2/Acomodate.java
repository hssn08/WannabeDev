package hassan;


public class Acomodate {
    protected int roomNumber;
    protected String roomType;
    
    public Acomodate(int number, String type) {
    	this.roomNumber = number;
        this.roomType = type;
	}

	public int getRoomNumber() {
        return roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    
}