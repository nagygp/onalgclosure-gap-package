LoadPackage("onalgclosure");

fr:=AC_FrobeniusAutomorphism(9);
fr^2;
One(fr);
AC_FrobeniusAutomorphism(8)*AC_FrobeniusAutomorphism(16);

fr:=AC_FrobeniusAutomorphism(9);
Z(3)^fr;
Z(27)^fr;

v:=Random(GF(27)^5);
v^fr;
cv:=CVec(v);
cv^fr;

m:=Random(GL(5,81));
m^fr;
cm:=CMat(m);
cm^fr;
last=m^fr;

fr:=AC_FrobeniusAutomorphism(7^2);
x:=Indeterminate(GF(7),"x");
pol:=(x^3-Z(7))/(x^2-Z(7^3));
pol^fr;
First([1..100],i->pol=pol^(fr^i));

fr:=AC_FrobeniusAutomorphism(7^2);
m:=[[0*Z(7),Z(7^3)],[Z(7^4)^-1,Z(7)^0]];
AC_FrobeniusAutomorphismOrbit(fr,m);


###

mg:=GL(3,11);
Size(mg);
oset:=Orbit(mg,Z(11)^0*[0,0,1],OnLines);; Size(oset);


pg:=AC_ProjectiveTransformationGroupWithShortOrbit(mg,oset);
Size(pg);

vec:=Z(11)*[1,Z(121),0];
# wrong: 
#OrbitLength(pg,vec);
# correct: 
OrbitLength(pg,NormedRowVector(vec));

121^2-11^2+121-11;

###

q:=13;
mg:=GU(3,q);
Size(mg);
oset:=Orbit(mg,Z(q)^0*[0,0,1],OnLines);; 
Size(oset); q^3+1;

pg:=AC_ProjectiveTransformationGroupWithShortOrbit(mg,oset);
Size(pg); Size(PGU(3,q));

###

q:=5;
mg:=GU(3,q);
Size(mg);
oset:=Orbit(mg,Z(q)^0*[0,0,1],OnLines);; 
Size(oset); q^3+1;

pg:=AC_ProjectiveTransformationGroupWithShortOrbit(mg,oset);
Size(pg); Size(PGU(3,q));
vec:=Z(q)*[1,Z(q^3),0];

OrbitLength(pg,NormedRowVector(vec));

