fn main () {
    let mut x :i32 =0;
    let mut done=false;

    while ! done {
        x += 1;
        for i in 1..20 {
            done=true;
            if x%i > 0 {
                done=false;
                break;
            }
        }
    }
    println! ("{}", x);
}
