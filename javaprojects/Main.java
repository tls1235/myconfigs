import java.util.ArrayList;
import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    ArrayList<String> temp = new ArrayList<>();
    while (sc.hasNextLine()) {
      temp.add(sc.nextLine());
    }
    String[] input = temp.toArray(new String[0]);
    if (input[0].contains("/")) {
      for (int i = 0; i < input.length; i++) {
        if (input[i].substring(input[i].lastIndexOf("/")).contains(args[0])) {
          System.out.println(input[i].replace(" ", "\\ "));
        }
      }
    } else {
      System.out.println("\nthe file does not exist in this databse");
    }
    sc.close();
  }
}
