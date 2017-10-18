#############################################################################
# This file contains another implementation of the Frobenius automorphism of finite fields. 
# Let $q$ be a prime power. The command
#
# AC_FrobeniusAutomorphism(q)
#
# constructs the map x->x^q which applies to
#
# - finite field elements,
# - finite field vectors (coordinate-wise),
# - finite field matrices (element-wise),
# - rational functions over finite fields (coeffitient-wise).
#
# The characteristic of AC_FrobeniusAutomorphism(q) is the characteristic of the underlying GF(q).
#
# AC-Frobenius automorphisms of the same characteristic can be multiplied and raised to integer power. 
#
# It is easy to install methods for the action of an AC-Frobenius automorphism on new classes of objects. 
#
# Notice that AC-Frobenius automorphisms are not mappings in the sense of the GAP programming language.
#
# Gabor P. Nagy (http://www.math.u-szeged.hu/~nagyg), 07/06/2017


DeclareCategory( "IsAC_FrobeniusAutomorphism", IsMultiplicativeElementWithOne );
DeclareRepresentation( "IsAC_FrobeniusAutomorphismRep", IsPositionalObjectRep and IsMultiplicativeElement, [4] );
AC_FrobeniusAutomorphismFamily:=NewFamily("AC_FrobeniusAutomorphismFam");

#! @Chapter Usage
#! @Section Installation
#! Download und unpack the file <P/>
#! 
#! <URL>http://www.math.u-szeged.hu/~nagyg/OnAlgClosure-0.1.tar.gz</URL><P/>
#! 
#! into your pkg directory. You can load the package with the command<P/>
#! 
#! <C>LoadPackage("OnAlgClosure");</C><P/>

#! @Section Functions for AC-Frobenius automorphism actions
#! @Arguments q
#! @Returns an AC-Frobenius automorphism
#! @Description
#!  Creates the Frobenius map $x->x^q$ for the prime power <A>q</A> which
#!  operates on objects of characteristic $p$: vectors, matrices (also in
#!  <Package>CVEC</Package> representation), polynomials and rational functions.
#!  The argument may be the finite field <C>GF(q)</C> as well. 
DeclareGlobalFunction("AC_FrobeniusAutomorphism");

#! Although algebraic closure is not defined in &GAP; one can say that AC-Frobenius automorphisms act on the algebraic closure of the prime field <C>GF(p)</C>.
#! <P/>An AC-Frobenius automorphism has infinite order. By default, no inverse of an AC-Frobenius automorphism is defined. 
#! AC-Frobenius automorphisms are not mapping as &GAP; objects.  
#! <P/>These are the main differences to the &GAP; command <C>FrobeniusAutomorphism</C>.
#! <P/>It must be easy to install methods for the action of an AC-Frobenius automorphism on new classes of objects. 

#! @InsertChunk AC_FrobeniusAutomorphism_example1

#!  AC-Frobenius automorphisms of the same characteristic can be multiplied 
#!  and share a unique multiplicative identity. 

#! @InsertChunk AC_FrobeniusAutomorphism_example2

#! @Arguments fr,obj
#! @Returns the Frobenius orbit of the given object as list
#! @Description
#!  The (i+1)th element of the Frobenius orbit is $obj^(fr^i)$.
DeclareGlobalFunction("AC_FrobeniusAutomorphismOrbit");

#! @InsertChunk AC_FrobeniusAutomorphismOrbit_example

#! An AC-Frobenius automorphism has infinite order. By default, no inverse of an AC-Frobenius automorphism is defined. 
#! AC-Frobenius automorphisms are not mapping as &GAP; objects. If you want, they act on the algebraic closure of the prime field <C>GF(p)</C>.
#! In fact, these are the main differences to the &GAP; command <C>FrobeniusAutomorphism</C>. 
#!  <P/>It must be easy to install methods for the action of an AC-Frobenius automorphism on new classes of objects. 

