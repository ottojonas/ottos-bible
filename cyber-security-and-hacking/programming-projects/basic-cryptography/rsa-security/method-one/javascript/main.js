function gcd(a, h) {
  let temp;
  while (true) {
    temp = a % h;
    if (temp == 0) return h;
    a = h;
    h = temp;
  }
}

let p = 3;
let q = 7;

let n = p * q;

let e = 2;
let phi = (p - 1) * (q - 1);
while (e < phi) {
  if (gcd(e, phi) == 1) break;
  else e++;
}

let k = 2;
let d = (1 + k * phi) / e;

let msg = 12;

console.log("message data = " + msg);

let c = Math.pow(msg, e);
c = c % n;
console.log("encrypted data = " + c);

let m = Math.pow(c, d);
m = m % n;
console.log("original message send = " + m);
