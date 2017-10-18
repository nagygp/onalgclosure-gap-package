#! @Chapter Examples

#! @BeginChunk AC_FrobeniusAutomorphism_example1
#! @BeginExample
fr:=AC_FrobeniusAutomorphism(9);
#! AC_FrobeniusAutomorphism(3^2)
Z(3)^fr;
#! Z(3)
Z(27)^fr;
#! Z(3^3)^9
v:=Random(GF(27)^5);
#! [ Z(3)^0, Z(3^3)^23, Z(3^3)^23, Z(3^3)^17, Z(3)^0 ]
v^fr;
#! [ Z(3)^0, Z(3^3)^25, Z(3^3)^25, Z(3^3)^23, Z(3)^0 ]
cv:=CVec(v);
#! <cvec over GF(3,3) of length 5>
cv^fr;
#! <cvec over GF(3,3) of length 5>
cv^fr=v^fr;
#! true
#! @EndExample

#! @BeginExample
fr:=AC_FrobeniusAutomorphism(7^2);
#! AC_FrobeniusAutomorphism(7^2)
x:=Indeterminate(GF(7),"x");;
pol:=(x^3-Z(7))/(x^2-Z(7^3));
#! (x^3+Z(7)^4)/(x^2+Z(7^3)^172)
pol^fr;
#! (x^3+Z(7)^4)/(x^2+Z(7^3)^220)
pol=pol^(fr^3);
#! true
#! @EndExample
#@EndChunk

#! @BeginChunk AC_FrobeniusAutomorphism_example2
#! @BeginExample
fr:=AC_FrobeniusAutomorphism(9);
#! AC_FrobeniusAutomorphism(3^2)
fr^2;
#! AC_FrobeniusAutomorphism(3^4)
One(fr);
#! AC_FrobeniusAutomorphism(3^0)
AC_FrobeniusAutomorphism(8)*AC_FrobeniusAutomorphism(16);
#! AC_FrobeniusAutomorphism(2^7)
One(last)=One(fr);
#! false
#! @EndExample
#@EndChunk


#! @BeginChunk AC_FrobeniusAutomorphismOrbit_example

#! @BeginExample
fr:=AC_FrobeniusAutomorphism(7^2);
#! AC_FrobeniusAutomorphism(7^2)
m:=[[0*Z(7),Z(7^3)],[Z(7^4)^-1,Z(7)^0]];
#! [ [ 0*Z(7), Z(7^3) ], [ Z(7^4)^2399, Z(7)^0 ] ]
AC_FrobeniusAutomorphismOrbit(fr,m);
#! [ [ [ 0*Z(7), Z(7^3) ], [ Z(7^4)^2399, Z(7)^0 ] ], [ [ 0*Z(7), Z(7^3)^49 ], [ Z(7^4)^2351, Z(7)^0 ] ], 
#!   [ [ 0*Z(7), Z(7^3)^7 ], [ Z(7^4)^2399, Z(7)^0 ] ], [ [ 0*Z(7), Z(7^3) ], [ Z(7^4)^2351, Z(7)^0 ] ], 
#!   [ [ 0*Z(7), Z(7^3)^49 ], [ Z(7^4)^2399, Z(7)^0 ] ], [ [ 0*Z(7), Z(7^3)^7 ], [ Z(7^4)^2351, Z(7)^0 ] ] ]
#! @EndExample

#@EndChunk

