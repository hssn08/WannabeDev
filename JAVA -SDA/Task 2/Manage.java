package hassan;


import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;



class Reservation extends Acomodate {
    private Guest guest;
    private String checkInDate;
    

    public Reservation( Guest guest,Room selected, String checkInDate) {
        super(selected.roomNumber, selected.getRoomType());
        this.guest = guest;
        this.checkInDate = checkInDate;
    }
    public Guest getGuest() {
        return guest;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

   
}

class Guest {
    private String guestName;
    private int guestId;

    public Guest(String guestName, int guestId) {
        this.guestName = guestName;
        this.guestId = guestId;
    }

    public String getGuestName() {
        return guestName;
    }

    public int getGuestId() {
        return guestId;
    }
}

class Hotel {
    private String hotelName;
    protected List<Room> rooms;
    protected List<Reservation> reservations;

    public Hotel(String hotelName) {
        this.hotelName = hotelName;
        this.rooms = new ArrayList<>();
        this.reservations = new ArrayList<>();
    }
    
    public String getHotelname() {
    	return hotelName;
    }
    
    public void addRoom(int roomNumber, String roomType) {
    	boolean already = false;
    	for (Room room : rooms) {
        	if (room.getRoomNumber() == roomNumber)
        	{
        		System.out.println("Room No : " + roomNumber + " Already Exist");
        		already = true;
        		break;
        	}
    	}
        	if (!already)
        	{
        		 Room room = new Room(roomNumber, roomType);
        		 rooms.add(room);
        		 System.out.println("Room No : " + roomNumber + " Successfully Added!");
        	}
    	
    }

    public List<Room> getAvailableRooms(String Date) {
    	
    	 List<Room> availableRooms = new ArrayList<>();
        for (Room room : rooms) {
        	
             if (!room.getBookingDates().contains(Date)) {
            	 availableRooms.add(room);
             }
             
            
        }
        return availableRooms;
    }

    public Guest searchGuest(int guestId) {
        for (Reservation reservation : reservations) {
            if (reservation.getGuest() != null && reservation.getGuest().getGuestId() == guestId) {
                return reservation.getGuest();
            }
        }
        return null;
    }

    public boolean bookRoom(Guest guest, Room selectedRoom, String checkDate) {
        boolean roomFound = false;
        boolean available = false;
        
        for (Room room : rooms) {
            if (room.getRoomNumber() == selectedRoom.getRoomNumber()) {
                roomFound = true;
                if (!room.getBookingDates().contains(checkDate)) {
                    available = true;
                }
                break; // Room found, exit the loop
            }
        }

        if (!roomFound) {
            System.out.println("Room not found!");
        }

        if (available) {
            Reservation reservation = new Reservation(guest, selectedRoom, checkDate);
            reservations.add(reservation);
            selectedRoom.book(checkDate);
            System.out.println("Room " + selectedRoom.getRoomNumber() + " is booked on " + checkDate);
            return true;
        } else {
            System.out.println("Room " + selectedRoom.getRoomNumber() + " is not available on " + checkDate);
            return false;
        }
    }


    public boolean reserveRoom(Guest guest,Room selectedRoom, String checkDate) 
    {
    	boolean roomFound = false;
        boolean available = false;
        
        for (Room room : rooms) {
            if (room.getRoomNumber() == selectedRoom.getRoomNumber()) {
                roomFound = true;
                if (!room.getBookingDates().contains(checkDate)) {
                    available = true;
                }
                break; // Room found, exit the loop
            }
        }

        if (!roomFound) {
            System.out.println("Room not found!");
        }
    	
        if (available) {
            Reservation reservation = new Reservation(guest, selectedRoom, checkDate);
            reservations.add(reservation);
            selectedRoom.reserve(checkDate);
            return true;
        } else {
            return false;
        }
    }
}

public class Manage {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Hotel hotel = new Hotel("My Hotel");
        


        //available rooms list
        List<Room> availableRooms = new ArrayList<>();
        
        while (true) {

       	 	System.out.println("\n\t\t\t--> Welcome To Hotel");
            System.out.println("1. Add Room");
            System.out.println("2. Get Available Rooms");
            System.out.println("3. Search Guest");
            System.out.println("4. Book Room");
            System.out.println("5. Reserve Room");
            System.out.println("6. Exit");
            System.out.print("Enter your choice: ");

       	 	System.out.print("\n-----------------------------------------------------------\n");
            int choice = scanner.nextInt();
       	 	System.out.print("-----------------------------------------------------------\n");
            switch (choice) {
            //add room
                case 1:
                    System.out.print("Enter Room Number: ");
                    int roomNumber = scanner.nextInt();
                    System.out.print("Enter Room Type: ");
                    scanner.nextLine(); // Consume the newline character
                    String roomType = scanner.nextLine();
                    hotel.addRoom(roomNumber, roomType);
                    break;

           //Shows Available Rooms
                case 2:

                    
                	 System.out.print("Enter Date On Which You Want To Check Availability: ");
                     scanner.nextLine(); // Consume the newline character
                     String Date = scanner.nextLine();
                     
                    availableRooms = hotel.getAvailableRooms(Date);
                    System.out.println("\t\t\tAvailable Rooms:");
                    for (Room room : availableRooms) {
                        System.out.println("Room Number: " + room.getRoomNumber() + ", Type: " + room.getRoomType());
                    }
                    break;
                    
          //Search For Guest
                
                case 3:
                    System.out.print("Enter Guest ID: ");
                    int guestId = scanner.nextInt();
                    Guest guest = hotel.searchGuest(guestId);
                    if (guest != null) {
                        System.out.println("Guest Found: " + guest.getGuestName());
                       
                        
                        
                    } else {
                        System.out.println("Guest not found!");
                    }
                    break;
                    
         //Book Room
                    
                case 4:
                    System.out.print("Enter Guest ID: ");
                    guestId = scanner.nextInt();
                    guest = hotel.searchGuest(guestId);
                    if (guest != null) {
                        System.out.println("Guest Found: " + guest.getGuestName());
                    } else {
                        System.out.print("Enter Guest Name: ");
                        scanner.nextLine(); // Consume the newline character
                        String guestName = scanner.nextLine();

                        Guest newGuest = new Guest(guestName, guestId);
                        guest = newGuest; // Assign the new guest to the guest variable
                    }
                    
                    
               	    System.out.print("Enter Date On Which You Want To Check Availability: ");
                   
                    Date = scanner.nextLine();
                    
                    availableRooms = hotel.getAvailableRooms(Date);

               	 	 System.out.println("\t\t\tAvailable Rooms:");
                    for (Room room : availableRooms) {
                        System.out.println("Room Number: " + room.getRoomNumber() + ", Type: " + room.getRoomType());
                    }
                    

                    System.out.print("Enter Room Number: ");
                    roomNumber = scanner.nextInt();
                    System.out.print("Enter Check-In Date: ");
                    scanner.nextLine(); // Consume the newline character
                    String checkInDate = scanner.nextLine();

                    Room bookedRoom = null;
                    for (Room room : hotel.rooms) {
                        if (room.getRoomNumber() == roomNumber) {
                            bookedRoom = room;
                        }
                    }

                    if (bookedRoom != null) {
                        boolean isBooked = hotel.bookRoom(guest, bookedRoom, checkInDate);
                        if (isBooked) {
                        } else {
                        	
                        }
                    } else {
                        System.out.println("Room not found!");
                    }
                    break;

           //Reserves The Room
                case 5:
           //checks for already a guest	
                	System.out.print("Enter Guest ID: ");
                    guestId = scanner.nextInt();
                    guest = hotel.searchGuest(guestId);
                    if (guest != null) {
                        System.out.println("Guest Found: " + guest.getGuestName());
                    } else {
                        System.out.print("Enter Guest Name: ");
                        scanner.nextLine(); // Consume the newline character
                        String guestName = scanner.nextLine();

                        Guest newGuest = new Guest(guestName, guestId);
                        guest = newGuest; // Assign the new guest to the guest variable
                    }
                	
            //displays all available rooms
                    
               	    System.out.print("Enter Date On Which You Want To Check Availability: ");
                    Date = scanner.nextLine();
                    

               	 	availableRooms = hotel.getAvailableRooms(Date);
                    System.out.println("\t\t\tAvailable Rooms:");
                    for (Room room : availableRooms) {
                        System.out.println("Room Number: " + room.getRoomNumber() + ", Type: " + room.getRoomType());
                    }

               	 	 
                    System.out.print("Enter Room Number: ");
                    int reserveRoomNumber = scanner.nextInt();
                    System.out.print("Enter Check-In Date: ");
                    scanner.nextLine(); // Consume the newline character
                    String reserveCheckInDate = scanner.nextLine();
                    
                    Room reservedRoom = null;
                    for (Room room : hotel.rooms) {
                        if (room.getRoomNumber() == reserveRoomNumber) {
                            reservedRoom = room;
                            break; // Found the room, exit the loop
                        }
                    }

                    if (reservedRoom != null) {
                        boolean isReserved = hotel.reserveRoom(guest,reservedRoom, reserveCheckInDate);
                        if (isReserved) {
                            System.out.println("Room reserved successfully!");
                        } else {
                            System.out.println("Room is not available on the selected dates!");
                        }
                    } else {
                        System.out.println("Room not found!");
                    }
                    break;

                case 6:
                    System.out.println("Exiting the Hotel Management System. Goodbye!");
                    System.exit(0);
                    break;

                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }
}