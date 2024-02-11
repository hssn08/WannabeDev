import java.util.ArrayList;
import java.util.List;

public class Donor {
    private String donorId;
    private String username;
    private String password;
    private List<DonorReview> reviews;

    public Donor(String donorId, String username, String password) {
        this.donorId = donorId;
        this.username = username;
        this.password = password;
        this.reviews = new ArrayList<>();
    }

    public String getDonorId() {
        return donorId;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public List<DonorReview> getReviews() {
        return reviews;
    }

    public void addReview(int rating, String review) {
        DonorReview donorReview = new DonorReview(donorId, rating, review);
        reviews.add(donorReview);
    }
}
