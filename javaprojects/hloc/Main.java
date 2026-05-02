import java.util.ArrayList;

public class Main {
  public static void main(String[] args) {
    String[] input = args[0].split("\n");
    ArrayList<String> output = new ArrayList<>();
    for (int i = 0; i < input.length; i++) {
      if (input[i].substring(input[i].lastIndexOf("/")).contains(args[1])) {
        output.add(input[i]);
      }
    }
    for (int i = 0; i < output.size(); i++) {
      System.out.println(output.get(i));
    }
  }
}
