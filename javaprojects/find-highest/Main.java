import java.util.ArrayList;
import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int i = 0;
    int j = 0;
    double highestvalue = 0;
    int pointofhighestvalue = 0;
    String scannerinput;
    double finalstringvalue;
    ArrayList<Double> input = new ArrayList<>();
    ArrayList<Double> list = new ArrayList<>();
    while (true) {
      System.out.print("insert a number or insert 'find' to measure which number was highest: ");
      scannerinput = scanner.nextLine();
      try {
        finalstringvalue = Double.parseDouble(scannerinput);
        input.add(finalstringvalue);
      } catch (Throwable e) {
        if (scannerinput.equals("find")) {
          break;
        } else {
          System.out.print("\n\nplease do not enter anything other than 'find' or a number\n\n\n");
        }
      }
    }
    for (i = 0; i < input.size(); i++) {
      while (!(list.get(j) > input.get(i))) {
        j++;
      }
    }
    scanner.close();
    System.out.printf("\n\n\n\nthe highest number in the list was %.2f and it was the number %d you have entered!",
        highestvalue,
        pointofhighestvalue + 1);
  }
}
