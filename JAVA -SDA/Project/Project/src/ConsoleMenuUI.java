import java.util.Scanner;

public class ConsoleMenuUI implements MenuUI {
    private App app;

    public ConsoleMenuUI(App app) {
        this.app = app;
    }

    @Override
    public void displayMenu() {
        System.out.println("Blood Donation App Menu:");
        System.out.println("1. Donate blood");
        System.out.println("2. View donation history");
        System.out.println("3. Rate and review donor");
        System.out.println("4. Request for specific blood");
        System.out.println("0. Exit");
        System.out.print("Enter your choice: ");
    }

    @Override
    public void processOption(int option, Scanner scanner) {
        switch (option) {
            case 1:
                donateBlood(scanner);
                break;
            case 2:
                viewDonationHistory();
                break;
            case 3:
                rateAndReviewDonor(scanner);
                break;
            case 4:
                requestSpecificBlood(scanner);
                break;
            case 0:
                System.out.println("Exiting the application. Goodbye!");
                System.exit(0);
            default:
                System.out.println("Invalid option. Please enter a valid option.");
        }
    }

    private void donateBlood(Scanner scanner) {
        DonationUI donationUI = new ConsoleDonationUI();
        donationUI.getDonationDetailsFromUser(scanner);
    }

    private void viewDonationHistory() {
        app.viewDonationHistory();
    }

    private void rateAndReviewDonor(Scanner scanner) {
        Donor donor = new Donor("D001", "JohnDoe", "password123");
        String reviewResult = app.reviewDonor(donor, scanner);
        System.out.println(reviewResult);
    }

    private void requestSpecificBlood(Scanner scanner) {
        String requestResult = app.requestBlood(scanner);
        System.out.println(requestResult);
    }
}
