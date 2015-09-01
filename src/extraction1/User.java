package extraction1;

/**
 * Created by Mounica on 3/31/15.
 */
public class User {
    private String userId;
    private String gender;
    private String age;
    private int noOfTweets;

    private String tweetsText;
    private float openS, consS, extS, agrS, neuS;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getTweetsText() {
        return tweetsText;
    }

    public void setTweetsText(String tweetsText) {
        this.tweetsText = tweetsText;
    }

    public float getOpenS() {
        return openS;
    }

    public void setOpenS(float openS) {
        this.openS = openS;
    }

    public float getConsS() {
        return consS;
    }

    public void setConsS(float consS) {
        this.consS = consS;
    }

    public float getExtS() {
        return extS;
    }

    public void setExtS(float extS) {
        this.extS = extS;
    }

    public float getAgrS() {
        return agrS;
    }

    public void setAgrS(float agrS) {
        this.agrS = agrS;
    }

    public float getNeuS() {
        return neuS;
    }

    public void setNeuS(float neuS) {
        this.neuS = neuS;
    }

    public int getNoOfTweets() {
        return noOfTweets;
    }

    public void setNoOfTweets(int noOfTweets) {
        this.noOfTweets = noOfTweets;
    }
}