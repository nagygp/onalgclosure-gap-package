#############################################################################
# This file contains another implementation of the Frobenius automorphism of finite fields. 
# Let $q$ be a prime power. The commands
#
# AC_FrobeniusAutomorphism(q)
# AC_FrobeniusAutomorphism(GF(q))
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
# It is easy to install methods for the action of a AC-Frobenius automorphism on new classes of objects. 
#
# Notice that AC-Frobenius automorphisms are not mappings in the sense of the GAP programming language.
#
# Gabor P. Nagy (http://www.math.u-szeged.hu/~nagyg), 07/06/2017


#############################################################################
##  CONSTRUCTORS
##  -------------------------------------------------------------------------

InstallGlobalFunction( AC_FrobeniusAutomorphism,
function(q) 
	local p,d;
	if not((IsField(q) and IsFinite(q)) or IsPrimePowerInt(q)) then
		return Error("arguments must be a finite field or a prime power\n");
	fi;
	if IsField(q) then
		q:=Size(q);
	fi;
	d:=FactorsInt(q);
	p:=d[1]; d:=Length(d);
	return Objectify(
		NewType(AC_FrobeniusAutomorphismFamily,IsAC_FrobeniusAutomorphism and IsAC_FrobeniusAutomorphismRep),
		[p,d,q]); 
end);

InstallMethod( Characteristic,
	"for a AC-Frobenius automorphism",
	[ IsAC_FrobeniusAutomorphism ],
function( x )
  return x![1];
end );


#############################################################################
##  DISPLAYING AND COMPARING ELEMENTS
##  -------------------------------------------------------------------------

InstallMethod( ViewObj, "for an AC-Frobenius automorphism",
	[ IsAC_FrobeniusAutomorphism ],
function( obj )
	Print( "AC_FrobeniusAutomorphism(", obj![1], "^", obj![2], ")" );
end );

InstallMethod( Display, "for an AC-Frobenius automorphism",
	[ IsAC_FrobeniusAutomorphism ],
function( obj )
	Print( "AC-Frobenius automorphism (.)^(", obj![1], "^", obj![2], ")" );
end );

InstallMethod( PrintObj, "for an AC-Frobenius automorphism",
	[ IsAC_FrobeniusAutomorphism ],
function( obj )
	Print( "AC_FrobeniusAutomorphism(", obj![3], ")" );
end );

InstallMethod( \=, "for two AC-Frobenius automorphisms",
	IsIdenticalObj,
	[ IsAC_FrobeniusAutomorphism, IsAC_FrobeniusAutomorphism ],
function( fr1, fr2 )
	return [fr1![1],fr1![2]] = [fr2![1],fr2![2]];
end );

InstallMethod( \<, "for two AC-Frobenius automorphisms",
	IsIdenticalObj,
	[ IsAC_FrobeniusAutomorphism, IsAC_FrobeniusAutomorphism ],
function( fr1, fr2 )
	return [fr1![1],fr1![2]] < [fr2![1],fr2![2]];
end );


#############################################################################
##  MULTIPLICATION
##  -------------------------------------------------------------------------

InstallMethod( \*, "for two AC-Frobenius automorphisms",
	IsIdenticalObj,
	[ IsAC_FrobeniusAutomorphism, IsAC_FrobeniusAutomorphism ],
function( fr1, fr2 )
	if fr1![1]=fr2![1] then 
		return Objectify(TypeObj(fr1),[fr1![1],fr1![2]+fr2![2],fr1![3]*fr2![3]]); 
	else
		Error("two AC-Frobenius automorphisms must have the same characteristic\n");
	fi;
end );

InstallMethod( \^, "for an AC-Frobenius automorphism and a positive integer",
	[ IsAC_FrobeniusAutomorphism, IsPosInt ],
function( fr, k )
	return Objectify(TypeObj(fr),[fr![1],fr![2]*k,fr![3]^k]); 
end );

InstallMethod( OneMutable, "for an AC-Frobenius automorphism",
	[ IsAC_FrobeniusAutomorphism ],
function( fr )
	return Objectify(TypeObj(fr),[fr![1],0,1]); 
end );

#############################################################################
##  ACTIONS
##  -------------------------------------------------------------------------

InstallMethod( \^, "for an AC-Frobenius automorphism and a finite field element",
	[ IsFFE, IsAC_FrobeniusAutomorphism ],
function( x, fr )
	local pw;
	if Characteristic(x)=Characteristic(fr) then 
		pw:=fr![1]^(fr![2] mod DegreeFFE(x));
		return x^pw;
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );

InstallOtherMethod( \^, "for an AC-Frobenius automorphism and a finite field vector",
	[ IsFFECollection, IsAC_FrobeniusAutomorphism ],
function( x, fr )
	local y;
	if Characteristic(x)=Characteristic(fr) then 
		y:=fr![1]^(fr![2] mod DegreeFFE(x));
		y:=List(x,u->u^y);
		if IsCVecRep(x) then
			return CVec(y,CVecClass(x));
		else
			return y;
		fi;
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );

InstallOtherMethod( \^, "for an AC-Frobenius automorphism and a finite field matrix",
	[ IsFFECollColl, IsAC_FrobeniusAutomorphism ],
function( x, fr )
	local y;
	if Characteristic(x)=Characteristic(fr) then 
		y:=fr![1]^(fr![2] mod DegreeFFE(x));
		y:=List(x,uu->List(uu,u->u^y));
		if IsCMatRep(x) then
			return CMat(List(y,u->CVec(u,CVecClass(x[1]))));
		else
			return y;
		fi;
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );

#############################################################################

InstallOtherMethod( \^, "for an AC-Frobenius automorphism and a rational function",
	[ IsRationalFunction, IsAC_FrobeniusAutomorphism ],
function( c, fr )
	local cnum,cdenom,i,pw;
	if Characteristic(c)=Characteristic(fr) then 
		cnum:=ShallowCopy(ExtRepNumeratorRatFun(c));
		cdenom:=ShallowCopy(ExtRepDenominatorRatFun(c));
		pw:=Concatenation(cnum,cdenom);
		pw:=List([1..Length(pw)/2],i->DegreeFFE(pw[2*i]));
		pw:=fr![1]^(fr![2] mod Maximum(pw));
		for i in [1..Length(cnum)/2] do cnum[2*i]:=cnum[2*i]^pw; od;
		for i in [1..Length(cdenom)/2] do cdenom[2*i]:=cdenom[2*i]^pw; od;
		if Length(cdenom)=2 and cdenom[1]=[] then 
			return PolynomialByExtRep(FamilyObj(c),cnum)/cdenom[2];
		else 
			return RationalFunctionByExtRep(FamilyObj(c),cnum,cdenom);;
		fi;
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );

#############################################################################

InstallMethod( \^, "for an AC-Frobenius automorphism and a finite field element",
	[ IsAlgebraicElement, IsAC_FrobeniusAutomorphism ],
function( x, fr )
	local pw;
	if Characteristic(x)=Characteristic(fr) then 
		pw:=fr![1]^fr![2];
		return x^pw;
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );

InstallOtherMethod( \^, "for an AC-Frobenius automorphism and a finite field vector",
	[ IsAlgebraicElementCollection, IsAC_FrobeniusAutomorphism ],
function( x, fr )
	if Characteristic(x)=Characteristic(fr) then 
		return List(x, y->y^fr);
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );

InstallOtherMethod( \^, "for an AC-Frobenius automorphism and a finite field matrix",
	[ IsAlgebraicElementCollColl, IsAC_FrobeniusAutomorphism ],
function( x, fr )
	local y;
	if Characteristic(x)=Characteristic(fr) then 
		return List(x,y->y^fr);
	else
		Error("the arguments must have the same characteristic\n");
	fi; 
end );


#############################################################################
##  FROBENIUS ORBIT
##  -------------------------------------------------------------------------
InstallGlobalFunction( AC_FrobeniusAutomorphismOrbit, 
function(fr,obj)
	local ret;
	ret:=[];
	while true do
		Add(ret,obj);
		obj:=obj^fr;
		if obj=ret[1] then break; fi;
	od;
	return ret;
end);

