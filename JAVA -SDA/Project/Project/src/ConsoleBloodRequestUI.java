import java.util.List;
import java.util.Scanner;

public class ConsoleBloodRequestUI implements BloodRequestUI {
    @Override
    public String requestBlood(BloodBank bloodBank, Scanner scanner) {
        try {
            System.out.println("Enter the blood type you are requesting (e.g., A, B, AB, O): ");
            String requestedBloodType = scanner.next().toUpperCase();

            List<BloodDonation> matchingDonations = bloodBank.getMatchingDonations(requestedBloodType);

            if (matchingDonations.isEmpty()) {
                return "No matching blood donations found for the requested type.";
            } else {
                System.out.println("Matching Blood Donations for Blood Type " + requestedBloodType + ":");
                for (BloodDonation donation : matchingDonations) {
                    System.out.println("Donation ID: " + donation.getDonationId());
                    System.out.println("Donor ID: " + donation.getDonor().getDonorId());
                    System.out.println("Blood Quantity: " + donation.getBloodQuantity() + " ml");
                    System.out.println("------------------------");
                }
                return "Blood request completed successfully.";
            }
        } catch (Exception e) {
            return "Error occurred while processing the blood request.";
        }
    }
}
