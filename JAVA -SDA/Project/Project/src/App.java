import java.util.List;
import java.util.Scanner;

public class App {
    private static BloodBank bloodBank = new BloodBank();
    private static ViewDonationHistoryUI viewDonationHistoryUI = new ConsoleViewDonationHistoryUI();
    private static DonorReviewUI donorReviewUI = new ConsoleDonorReviewUI();
    private static BloodRequestUI bloodRequestUI = new ConsoleBloodRequestUI();

    public static void donateBlood(int bloodQuantity, String bloodType, Donor donor) {
        BloodDonation donation = new BloodDonation(bloodQuantity, bloodType, donor);
        bloodBank.addBloodDonation(donation);
    }

    public static List<BloodDonation> viewBloodDonations() {
        return bloodBank.getBloodDonations();
    }

    public static String reviewDonor(Donor donor, Scanner scanner) {
        return donorReviewUI.rateAndReviewDonor(donor, scanner);
    }

    public static String requestBlood(Scanner scanner) {
        return bloodRequestUI.requestBlood(bloodBank, scanner);
    }

    public static BloodBank getBloodBank() {
        return bloodBank;
    }

    public static void viewDonationHistory() {
        viewDonationHistoryUI.viewDonationHistory(bloodBank);
    }

    // ... other methods ...

    public static void main(String[] args) {
        MenuUI menuUI = new ConsoleMenuUI(new App());

        Scanner scanner = new Scanner(System.in);

        while (true) {
            menuUI.displayMenu();

            int choice = scanner.nextInt();
            menuUI.processOption(choice, scanner);
        }
    }
}
