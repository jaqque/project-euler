fn main() {

    use std::f64; // square roots !

    const MAX :u64 = 1_000_000_000;
    let sqrt_of_max :u64 = (MAX as f64).sqrt() as u64;
    let mut sum_of_primes :u64 = 0;
    let mut count_of_primes :u64 = 0;
    let mut sieve: [bool; MAX as usize] = [true; MAX as usize];


    // cross out 1, circle 2
    sieve[1]=false;
    sieve[2]=true;

    for candidate in 1..sqrt_of_max {
        if ! sieve[candidate as usize] { continue; } // crossed out? skip it
        for stepper in (candidate*candidate..MAX).step_by(candidate as usize) {
            sieve[stepper as usize]=false; // cross out multiples of the candidiate
        }
    }

    for prime in 1..MAX {
        if sieve[prime as usize]  {
            sum_of_primes += prime;
            count_of_primes += 1;
        }
    }

    println! ("The total of the {} primes less than {} is {}",
        count_of_primes, MAX, sum_of_primes);

}
