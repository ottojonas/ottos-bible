#include <bits/stdc++.h>
#include <numeric>
#include <cmath>
using namespace std;

// returns gcd of a and b
int gcd(int a, int h) {
  int temp;
  while (1) {
    temp = a % h;
    if (temp == 0)
      return h;
    a = h;
    h = temp;
  }
}

// code to demonstrate RSA algorithm
int main() {
  // two random prime numbers
  int p = 3;
  int q = 7;

  // part 1 of public key
  int n = p * q;

  // finding part 2 of public key
  int e = 2;
  int phi = (p - 1) * (q - 1);
  while (e < phi) {
    // encrypt must be co-prime to phi and smaller than phi
    if (std::gcd(e, phi) == 1)
      break;
    else
      e++;
  }
  
  // private key
  // choosing decrypt such that is satisfies
  // decrypt*encrypt = 1 + k * totient
  int k = 2; // a constant value
  int d = (1 + (k * phi)) / e;

  // message to be encrypted
  double msg = 12;
  printf("message data = %lf", msg);

  // encryption c = (msg ^ encrypt) % n
  double c = pow(msg, e);
  c = fmod(c, n);
  printf("\nencrypted data = %lf", c);

  // decryption m = (c ^ d) % n
  double m = pow(c, d);
  m = fmod(m, n);
  printf("\noriginal message sent = %lf", m);

  return 0;
}
