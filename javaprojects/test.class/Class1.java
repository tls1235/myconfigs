public class Class1 {
  private int w;
  private int l;

  public void Setwidth(int w) {
    this.w = w;
  }

  public void Setlengh(int l) {
    this.l = l;
  }

  public void Showrectangle() {
    for (int i = 0; i < l; i++) {
      for (int j = 0; j < w; j++) {
        System.out.print("*");
      }
      System.out.print("\n");
    }
  }
}
