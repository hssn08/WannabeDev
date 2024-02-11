import java.util.Scanner;

public class ConsoleDonorReviewUI implements DonorReviewUI {
    @Override
    public String rateAndReviewDonor(Donor donor, Scanner scanner) {
        try {
            System.out.println("Enter your rating (1-5): ");
            int rating = scanner.nextInt();

            System.out.println("Enter your review: ");
            String review = scanner.next();  // For simplicity, assuming a single-word review

            donor.addReview(rating, review);

            return "Thank you for rating and reviewing the donor!";
        } catch (Exception e) {
            return "Error occurred while rating and reviewing the donor.";
        }
    }
}
