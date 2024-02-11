import java.util.Scanner;

public class ConsoleDonationUI implements DonationUI {
    @Override
    public void getDonationDetailsFromUser(Scanner scanner) {
        System.out.println("Enter donation details:");

        System.out.print("Blood Quantity (in milliliters): ");
        int bloodQuantity = scanner.nextInt();

        System.out.print("Blood Type: ");
        String bloodType = scanner.next();

        // Assuming the donor information is obtained separately, you can add logic for that here

        // For simplicity, let's assume a fixed donor for now
        Donor donor = new Donor("D001", "JohnDoe", "password123");

        // Use the static App methods to donate blood
        App.donateBlood(bloodQuantity, bloodType, donor);

        System.out.println("Blood donation added successfully!");
    }
}
