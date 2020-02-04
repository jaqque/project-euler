fn main() {

    use std::f64; // square roots !

    let mut primes = Vec::new();
    let mut is_prime;
    let mut sqrt :i64;
    let mut sum :i64 = 2; // sum of first two primes
    primes.push(2);

    for i in 3..2000000 as i64 {
        is_prime=true;
        sqrt=(i as f64).sqrt() as i64;
        for j in 0..primes.len() {
            if i%primes[j] == 0 {
                is_prime=false;
                break;
            }
            if primes[j] > sqrt {
                break;
            }
        }
        if is_prime {
            // println! ("{}", i);
            primes.push(i);
            sum += i;
        }
    }
    println! ("{}", primes.len());
    println! ("--> {}", sum);
}
