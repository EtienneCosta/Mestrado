public class Contact {


    private String name;
    private String address;
    private String emailAddress;
    private String phoneNumber;

    public Contact(String name) {
        this.name = name;
        address = null;
        emailAddress = null;
        phoneNumber = null;
    }


    public String getName() {
        return name;
    }

}
