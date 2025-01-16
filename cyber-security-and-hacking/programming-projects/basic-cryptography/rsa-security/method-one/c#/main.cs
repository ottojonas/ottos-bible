using System; 

public class GFG {
  public static double gcd(double a, double h) {
    double temp; 
    while(true) {
      temp = a % h; 
      if (temp == 0)
        return h; 
      a = h; 
      h = temp; 
    }
  }
  static void Main() {
    double p = 3;
    double q = 7; 

    double n = p * q; 

    double e = 2; 
    double phi = (p - 1) * (q - 1); 
    while (e < phi) {
      if (gcd(e, phi) == 1)
        break;
      else 
        e++; 
    }
    int k = 2; 
    double d = (1 + (k * phi)) / e; 

    double msg = 12;
    Console.WriteLine("message data = " + String.Format("{0:F6}", c)); 

    double m = Math.pow(c, d); 
    m = m % n; 
    Console.WriteLine("original message = " + String.Format("{0:F6}", m));
  }
}
