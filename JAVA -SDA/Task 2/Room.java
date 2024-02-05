package hassan;

import java.util.ArrayList;
import java.util.List;

public class Room extends Acomodate {
    private List<String> bookingDates;

    public Room(int number, String type) {
        super(number, type);
        bookingDates = new ArrayList<>();
    }
    
    public List<String> getBookingDates() {
        return bookingDates;
    }

    public void book(String bookingDate) {
        bookingDates.add(bookingDate);
    }

	public void reserve(String bookingDate) {
		bookingDates.add(bookingDate);
		
	}


  

   
}