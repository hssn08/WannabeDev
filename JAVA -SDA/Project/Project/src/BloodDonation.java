public class BloodDonation {
    private static int nextDonationId = 1;  // Static counter for generating unique donation IDs

    private int donationId;
    private int bloodQuantity;
    private String bloodType;
    private Donor donor;

    public BloodDonation(int bloodQuantity, String bloodType, Donor donor) {
        this.donationId = nextDonationId++;
        this.bloodQuantity = bloodQuantity;
        this.bloodType = bloodType;
        this.donor = donor;
    }

    public int getDonationId() {
        return donationId;
    }

    public int getBloodQuantity() {
        return bloodQuantity;
    }

    public void setBloodQuantity(int bloodQuantity) {
        this.bloodQuantity = bloodQuantity;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public Donor getDonor() {
        return donor;
    }

    public void setDonor(Donor donor) {
        this.donor = donor;
    }
}
