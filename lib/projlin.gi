#############################################################################
# This file contains another implementation of proejctive linear transformations over algebraic closures of finite fields. 
#
# AC-projective linear transformations of the same characteristic can be multiplied and raised to integer power. 
#
# It is easy to install methods for the action of an AC-projective linear transformation on new classes of objects. 
#
# Gabor P. Nagy (http://www.math.u-szeged.hu/~nagyg), 07/07/2017


#############################################################################
##  CONSTRUCTORS
##  -------------------------------------------------------------------------

InstallGlobalFunction( AC_ProjectiveLinearTransformation,
function(m) 
	if not(IsFFECollColl(m) and IsMatrix(m) and Length(m)=Length(m[1]) and not(IsZero(DeterminantMat(m)))) then
		Error("argument must be a nonsingular matrix over a finite field\n");
	fi;
	return Objectify(
		NewType(AC_ProjectiveLinearTransformationFamily,IsAC_ProjectiveLinearTransformation and IsAC_ProjectiveLinearTransformationRep),
		[m/First(m[1],x->not(IsZero(x))),Characteristic(m)]); 
end);

InstallMethod( Characteristic,
	"for an AC-projective linear transformation",
	[ IsAC_ProjectiveLinearTransformation ],
function( x )
  return x![2];
end );


#############################################################################
##  DISPLAYING AND COMPARING ELEMENTS
##  -------------------------------------------------------------------------

InstallMethod( ViewObj, "for an AC-projective linear transformation",
	[ IsAC_ProjectiveLinearTransformation ],
function( obj )
	Print( "AC_ProjectiveLinearTransformation(", obj![1], ")" );
end );

InstallMethod( Display, "for an AC-projective linear transformation",
	[ IsAC_ProjectiveLinearTransformation ],
function( obj )
	Print( "<AC-projective linear transformation of PG(", Length(obj![1]), ",", obj![2], ")>" );
end );

InstallMethod( PrintObj, "for an AC-projective linear transformation",
	[ IsAC_ProjectiveLinearTransformation ],
function( obj )
	Print( "AC_ProjectiveLinearTransformation(", obj![1], ")" );
end );

InstallMethod( \=, "for two AC-projective linear transformations",
	IsIdenticalObj,
	[ IsAC_ProjectiveLinearTransformation, IsAC_ProjectiveLinearTransformation ],
function( m1,m2 )
	return m1![1] = m2![1];
end );

InstallMethod( \<, "for two AC-projective linear transformations",
	IsIdenticalObj,
	[ IsAC_ProjectiveLinearTransformation, IsAC_ProjectiveLinearTransformation ],
function( m1, m2 )
	return m1![1] < m2![1];;
end );


#############################################################################
##  MULTIPLICATION
##  -------------------------------------------------------------------------

InstallMethod( \*, "for two AC-projective linear transformations",
	IsIdenticalObj,
	[ IsAC_ProjectiveLinearTransformation, IsAC_ProjectiveLinearTransformation ],
function( m1, m2 )
	if m1![2]=m2![2] then 
		return AC_ProjectiveLinearTransformation(m1![1]*m2![1]);
	else
		Error("two AC-projective linear transformations must have the same characteristic\n");
	fi;
end );

InstallMethod( InverseMutable, "for an AC-projective linear transformation and a positive integer",
	[ IsAC_ProjectiveLinearTransformation ],
function( m )
	return AC_ProjectiveLinearTransformation(m![1]^(-1));
end );

InstallMethod( OneMutable, "for an AC-projective linear transformation",
	[ IsAC_ProjectiveLinearTransformation ],
function( m )
	return AC_ProjectiveLinearTransformation(One(m![1])); 
end );

InstallMethod( \^, "for an AC-projective linear transformation and a positive integer",
	[ IsAC_ProjectiveLinearTransformation, IsPosInt ],
function( m, k )
	return AC_ProjectiveLinearTransformation(m![1]^k);
end );

#############################################################################
##  ACTIONS
##  -------------------------------------------------------------------------

InstallOtherMethod( \^, "for normed row vector and an AC-projective linear transformation", 
	[ IsFFECollection, IsAC_ProjectiveLinearTransformation],
function( x, m )
	local y;
	if Characteristic(x)<>Characteristic(m) then 
		Error("the arguments must have the same characteristic");
	fi;
	y:=First(x,u->not(IsZero(u)));
	if y=fail or not(IsOne(y)) then
		Error("action only defined for normed row vectors");
	fi;
	y:=OnLines(x,m![1]);
	if IsCVecRep(x) then
		return CVec(y,CVecClass(x));
	else
		return y;
	fi;
end );


#############################################################################
##  AC-PROJECTIVE LINEAR TRANSFORMATION GROUPS
##  -------------------------------------------------------------------------
InstallGlobalFunction( AC_ProjectiveTransformationGroupWithShortOrbit, 
function(matgr,oset)
	local xset,projgr;
	projgr:=GroupWithGenerators(List(GeneratorsOfGroup(matgr),AC_ProjectiveLinearTransformation));
	xset:=ExternalSet(projgr,Set(oset));
	SetNiceMonomorphism(projgr,ActionHomomorphism(xset));
	SetIsHandledByNiceMonomorphism(projgr,true);
	return projgr;
end );

