#!/usr/bin/env perl

# interpret \[ & \] directly
# h/t https://stackoverflow.com/a/24840720/977220
$GRAY="\001\e[90m\002";
$RSET="\001\e[0m\002";

print($GRAY);
$pwd = `pwd`; chomp($pwd);
@x = split(/\//, $pwd);
$me = `whoami`; chomp($me);
if (scalar(@x) ge 3 && $x[1] eq 'Users' && $x[2] eq $me) {
    shift(@x); shift(@x); shift(@x);
    if (scalar(@x) eq 0) {
        print($RSET);
        print('~');
        exit 0;
    }
    print('~/');
}
for ($i=0; $i<scalar(@x)-1; $i++) {
    print(substr($x[$i], 0, 1));
    print('/');
}
print($RSET);
print($x[scalar(@x)-1]);