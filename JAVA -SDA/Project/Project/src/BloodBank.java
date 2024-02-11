import java.util.ArrayList;
import java.util.List;

public class BloodBank {
    private List<BloodDonation> bloodDonations;

    public BloodBank() {
        this.bloodDonations = new ArrayList<>();
    }

    public void addBloodDonation(BloodDonation donation) {
        bloodDonations.add(donation);
    }

    public List<BloodDonation> getBloodDonations() {
        return bloodDonations;
    }

    public List<BloodDonation> getMatchingDonations(String requestedBloodType) {
        List<BloodDonation> matchingDonations = new ArrayList<>();
        for (BloodDonation donation : bloodDonations) {
            if (donation.getBloodType().equalsIgnoreCase(requestedBloodType)) {
                matchingDonations.add(donation);
            }
        }
        return matchingDonations;
    }
}
