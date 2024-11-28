package csd430.buller_08;

public class Cats {
    private String name;
    private String color;
    private String hairLength;

    public Cats() {}
    
    public Cats(String name, String color, String hairLength) {
        this.name = name;
        this.color = color;
        this.hairLength = hairLength;
    }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public String getHairLength() { return hairLength; }
    public void setHairLength(String hairLength) { this.hairLength = hairLength; }
    
}
