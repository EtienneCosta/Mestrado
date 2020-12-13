import java.util.LinkedList;
import java.util.ArrayList;

public class ContactList {
    private ArrayList<Contact> contacts;

    public ContactList() {
        contacts = new ArrayList<>();
    }

    public int getNumberOfContacts() {
        return contacts.size();
    }

    public Contact getContactByName(String name) {
        for (Contact c : contacts)
            if (c.getName() == name)
                return c;
        return null;
    }
}
