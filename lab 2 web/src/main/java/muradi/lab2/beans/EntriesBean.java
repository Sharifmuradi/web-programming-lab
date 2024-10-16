package muradi.lab2.beans;
import java.util.LinkedList;

public class EntriesBean {
    private LinkedList<Entry> entries;

    public EntriesBean() {
        this(new LinkedList<>());
    }

    public EntriesBean(LinkedList<Entry> entries) {
        this.entries = entries;
    }

    public LinkedList<Entry> getEntries() {
        return entries;
    }

    public void setEntries(LinkedList<Entry> entries) {
        this.entries = entries;
    }
}
