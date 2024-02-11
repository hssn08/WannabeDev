public class DonorReview {
    private String donorId;
    private int rating;
    private String review;

    public DonorReview(String donorId, int rating, String review) {
        this.donorId = donorId;
        this.rating = rating;
        this.review = review;
    }

    public String getDonorId() {
        return donorId;
    }

    public int getRating() {
        return rating;
    }

    public String getReview() {
        return review;
    }
}
