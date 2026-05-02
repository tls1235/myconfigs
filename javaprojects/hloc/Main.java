import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

public class Main {
  public static void main(String[] args) {
    String[] input = new String[0];
    try {
      input = Files.readAllLines(Paths.get("/home/tls123/javaprojects/hloc/.homedb")).toArray(new String[0]);
    } catch (IOException e) {
      e.printStackTrace();
    }
    ArrayList<String> output = new ArrayList<>();
    for (int i = 0; i < input.length; i++) {
      if (input[i].substring(input[i].lastIndexOf("/")).contains(args[0])) {
        output.add(input[i]);
      }
    }
    for (int i = 0; i < output.size(); i++) {
      System.out.println(output.get(i));
    }
  }
}
