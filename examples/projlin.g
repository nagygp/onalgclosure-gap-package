#! @Chapter Examples

#! @BeginChunk AC_ProjectiveLinearTransformation_example1
#! @BeginExample
m1:=[[ Z(5^2), 0*Z(5), 0*Z(5) ],[ 0*Z(5), Z(5)^0, 0*Z(5) ],[ 0*Z(5), 0*Z(5), Z(5^2)^19 ]];;
m2:=[[ Z(5^2)^13, Z(5)^2, Z(5)^0 ],[ Z(5)^2, Z(5)^2, 0*Z(5) ],[ Z(5)^0, 0*Z(5), 0*Z(5) ]];;
t1:=AC_ProjectiveLinearTransformation(m1);
#! AC_ProjectiveLinearTransformation([ [ Z(5)^0, 0*Z(5), 0*Z(5) ], [ 0*Z(5), Z(5^2)^23, 0*Z(5) ], [ 0*Z(5), 0*Z(5), Z(5)^3 ] ])
t2:=AC_ProjectiveLinearTransformation(m2);
#! AC_ProjectiveLinearTransformation([ [ Z(5)^0, Z(5^2)^23, Z(5^2)^11 ], [ Z(5^2)^23, Z(5^2)^23, 0*Z(5) ], 
#!   [ Z(5^2)^11, 0*Z(5), 0*Z(5) ] ])
Order(t1);
#! 24
t1*t2;
#! AC_ProjectiveLinearTransformation([ [ Z(5)^0, Z(5^2)^23, Z(5^2)^11 ], [ Z(5^2)^22, Z(5^2)^22, 0*Z(5) ], 
#!   [ Z(5^2)^5, 0*Z(5), 0*Z(5) ] ])
t1/t2;
#! AC_ProjectiveLinearTransformation([ [ 0*Z(5), 0*Z(5), Z(5)^0 ], [ 0*Z(5), Z(5^2)^11, Z(5^2)^11 ], [ Z(5)^3, Z(5), Z(5^2)^11 ] ])
One(t1);
#! AC_ProjectiveLinearTransformation([ [ Z(5)^0, 0*Z(5), 0*Z(5) ], [ 0*Z(5), Z(5)^0, 0*Z(5) ], [ 0*Z(5), 0*Z(5), Z(5)^0 ] ])
Characteristic(t1);
#! 5
#! @EndExample

#! @BeginChunk AC_ProjectiveLinearTransformation_example2
#! @BeginExample
q:=5;
#! 5
mg:=GU(3,q);
#! GU(3,5)
Size(mg);
#! 2268000
oset:=Orbit(mg,Z(q)^0*[0,0,1],OnLines);; 
Size(oset); q^3+1;
#! 126
#! 126

pg:=AC_ProjectiveTransformationGroupWithShortOrbit(mg,oset);
#! <group with 2 generators>
Size(pg); Size(PGU(3,q));
#! 378000
#! 378000
vec:=Z(q)*[1,Z(q^3),0];
#! [ Z(5), Z(5^3)^32, 0*Z(5) ]

OrbitLength(pg,NormedRowVector(vec));
#! 75600
StructureDescription(pg);
#! "PSU(3,5) : C3"
#! @EndExample
#@EndChunk



