import java.io.*; 
import java.math.*; 
import java.util.*; 

public class GFG {
  public static double gcd(double a, double h) 
  {
    /*
     * function returns the gcd or greatest common divider 
    */
    double temp; 
      while(true) {
        temp = a % h; 
        if (temp ==0) 
          return h; 
        a = h; 
        h = temp; 
    }
  }
  public static void main(String[] args)
  {
  double p = 3; 
  double q = 7; 
  // stores part 1 of public key 
  double n = p * q; 
  // finding part 2 of public key
  double e = 2; 
  double phi = (p - 1) * (q - 1); 
  while (e < phi) {
      // e must be co-prime to phi and smaller than phi 
      if (gcd(e, phi) == 1)
        break; 
      else
        e++; 
    }
    int k = 2; // constant value 
    double d = (1 + (k * phi)) / e; 

    // message to encrypt 
    double msg = 12; 
    System.out.println("message data = " + msg); 

    // encryption x = (msg ^ e) % n 
    double c = Math.pow(msg,e); 
    c = c % n; 
    System.out.println("encrypted data = " + c); 

    // decryption m = (c ^ d) % n 
    double m = Math.pow(c, d); 
    m = m % n; 

    System.out.println("original message send = " + m ); 
  }
}
