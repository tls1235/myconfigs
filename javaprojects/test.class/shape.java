public class shape {
  static int width;
  static int height;
  static String type;

  public shape(square temp) {
    width = temp.width;
    height = temp.height;
    type = "square";
  }

  public shape(tri temp) {
    height = temp.height;
    type = "triangle";
  }

  public static void printS() {
    if (type == "square") {
      for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
          System.out.print("*");
        }
        System.out.print("\n");
      }
    } else if (type == "triangle") {
      String counter = "*";
      for (int i = 0; i < height; i++) {
        System.out.print(counter);
        counter += '*';
        System.out.print("\n");
      }
    }
  }
}
