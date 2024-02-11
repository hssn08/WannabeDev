import java.util.List;

public class ConsoleViewDonationHistoryUI implements ViewDonationHistoryUI {
    @Override
    public void viewDonationHistory(BloodBank bloodBank) {
        System.out.println("Donation History:");

        List<BloodDonation> donations = bloodBank.getBloodDonations();

        if (donations.isEmpty()) {
            System.out.println("No donations found.");
        } else {
            for (BloodDonation donation : donations) {
                System.out.println("Donation ID: " + donation.getDonationId());
                System.out.println("Donor ID: " + donation.getDonor().getDonorId());
                System.out.println("Blood Quantity: " + donation.getBloodQuantity() + " ml");
                System.out.println("Blood Type: " + donation.getBloodType());
                System.out.println("------------------------");
            }
        }
    }
}
