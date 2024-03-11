package order;

public class orderDetails {
    private String email;
    private String itemId;
    private String itemName;
    private String itemPrice;
    private String image;
    private String link;

    public orderDetails() {
        // Default constructor
    }

    public orderDetails(String email, String itemId, String itemName, String itemPrice, String image, String link) {
        this.email = email;
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.image = image;
        this.link = link;
    }

    // Getters and setters

     public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(String itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
