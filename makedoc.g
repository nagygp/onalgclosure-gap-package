LoadPackage( "AutoDoc" );
AutoDoc( rec( scaffold:=true, autodoc := true ) );

# Create VERSION file for packaging
PrintTo( "VERSION", GAPInfo.PackagesInfo.onalgclosure[1].Version );

QUIT;
