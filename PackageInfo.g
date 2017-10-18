#############################################################################
##  
##  PackageInfo.g for the package `OnAlgClosure'                       Gabor P. Nagy
##                                                                
##  
##  This file contains meta-information on the package. It is used by
##  the package loading mechanism and the upgrade mechanism for the
##  redistribution of the package via the GAP website.
##  
##  For the LoadPackage mechanism in GAP >= 4.5 the minimal set of needed
##  entries is .PackageName, .Version, and .AvailabilityTest, and an error
##  will occur if any of them is missing. Other important entries are
##  .PackageDoc and .Dependencies. The other entries are relevant if the
##  package will be distributed for other GAP users, in particular if it
##  will be redistributed via the GAP Website.
##
##  With a new release of the package at least the entries .Version, .Date 
##  and .ArchiveURL must be updated.

SetPackageInfo( rec(

##  This is case sensitive, use your preferred spelling.
##
PackageName := "OnAlgClosure",

##  This may be used by a default banner or on a Web page, should fit on
##  one line.
Subtitle := "OnAlgClosure/Frobenius and projective linear action on objects of positive characteristic",

##  See '?Extending: Version Numbers' in GAP help for an explanation
##  of valid version numbers. For an automatic package distribution update
##  you must provide a new version number even after small changes.
Version := "0.1",
##  Release date of the current version in dd/mm/yyyy format.
##
Date := "07/07/2017",
##  Optional: if the package manual uses GAPDoc, you may duplicate the 
##  version and the release date as shown below to read them while building
##  the manual using GAPDoc facilities to distibute documents across files.
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.1">
##  <!ENTITY RELEASEDATE "7 June 2017">
##  <#/GAPDoc>

PackageWWWHome := "http://www.math.u-szeged.hu/~nagyg/OnAlgClosure/",

##  URL of the archive(s) of the current package release, but *without*
##  the format extension(s), like '.tar.gz' or '-win.zip', which are given next.
##  The archive file name *must be changed* with each version of the archive
##  (and probably somehow contain the package name and version).
##  The paths of the files in the archive must begin with the name of the
##  directory containing the package (in our "example" probably:
##  example/init.g, ...    or example-3.3/init.g, ...  )
# 
ArchiveURL := Concatenation( ~.PackageWWWHome, "OnAlgClosure-", ~.Version ),

##  All provided formats as list of file extensions, separated by white
##  space or commas.
##  Currently recognized formats are:
##      .tar.gz    the UNIX standard
##      .tar.bz2   compressed with 'bzip2', often smaller than with gzip
##      -win.zip   zip-format for DOS/Windows, text files must have DOS 
##                 style line breaks (CRLF)
ArchiveFormats := ".tar.gz",


##  Information about authors and maintainers is contained in the `Persons'
##  field which is a list of records, one record for each person; each 
##  person's record should be as per the following example: 
##  
Persons := [
  rec( 
    LastName      := "Nagy",
    FirstNames    := "Gábor P.",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "nagyg@math.u-szeged.hu",
    WWWHome       := "http://www.math.u-szeged.hu/~nagyg",
    PostalAddress := Concatenation( [
                       "Bolyai Institute of the University of Szeged\n",
                       "Aradi vértanúk tere 1\n",
                       "H-6720 Szeged (Hungary)" ] ),
    Place         := "Szeged",
    Institution   := "University of Szeged"
  ),
# provide such a record for each author and/or maintainer ...
  
],

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed 
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages 
##    "other"         for all other packages
##
Status := "dev",

##  You must provide the next two entries if and only if the status is 
##  "accepted" because is was successfully refereed:
# format: 'name (place)'
#CommunicatedBy := "",
# format: mm/yyyy
#AcceptDate := "",

##  For a central overview of all packages and a collection of all package
##  archives it is necessary to have two files accessible which should be
##  contained in each package:
##     - A README file, containing a short abstract about the package
##       content and installation instructions.
##     - The PackageInfo.g file you are currently reading or editing!
##  You must specify URLs for these two files, these allow to automate 
##  the updating of package information on the GAP Website, and inclusion
##  and updating of the package in the GAP distribution.
#
README_URL := 
  Concatenation( ~.PackageWWWHome, "README" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),

##  Here you  must provide a short abstract explaining the package content 
##  in HTML format (used on the package overview Web page) and an URL 
##  for a Webpage with more detailed information about the package
##  (not more than a few lines, less is ok):
##  Please, use '<span class="pkgname">GAP</span>' and
##  '<span class="pkgname">MyPKG</span>' for specifing package names.
##  
AbstractHTML := 
  "The <span class=\"pkgname\">OnAlgClosure</span> package provides \
   <span class=\"pkgname\">GAP</span> styled functionalities to use \
   the Frobenius map and the projective linear transformations \
   defined over the algebraic closure of the prime \
   field. In this sence, an AC-Forbenius automorphism or an AC-projective linear transformation \
   act on all finite field elements of the given positive characteristic. \
   It also induces Frobenius action on vectors, matrices, polynomials, etc.",

##  Here is the information on the help books of the package, used for
##  loading into GAP's online help and maybe for an online copy of the 
##  documentation on the GAP website.
##  
##  For the online help the following is needed:
##       - the name of the book (.BookName)
##       - a long title, shown by ?books (.LongTitle, optional)
##       - the path to the manual.six file for this book (.SixFile)
##  
##  For an online version on a Web page further entries are needed, 
##  if possible, provide an HTML- and a PDF-version:
##      - if there is an HTML-version the path to the start file,
##        relative to the package home directory (.HTMLStart)
##      - if there is a PDF-version the path to the .pdf-file,
##        relative to the package home directory (.PDFFile)
##      - give the paths to the files inside your package directory
##        which are needed for the online manual (as a list 
##        .ArchiveURLSubset of names of directories and/or files which 
##        should be copied from your package archive, given in .ArchiveURL 
##        above (in most cases, ["doc"] or ["doc","htm"] suffices).
##  
##  For links to other GAP or package manuals you can assume a relative 
##  position of the files as in a standard GAP installation.
##  
# in case of several help books give a list of such records here:
PackageDoc := rec(
  # use same as in GAP            
  BookName  := "OnAlgClosure",
  # format/extension can be one of .tar.gz, .tar.bz2, -win.zip, .zoo.
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile   := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  # LongTitle := "Elementary Divisors of Integer Matrices",
  LongTitle := "Frobenius and projective linear action on objects of positive characteristic",
),


##  Are there restrictions on the operating system for this package? Or does
##  the package need other packages to be available?
Dependencies := rec(
  # GAP version, use the version string for specifying a least version,
  # prepend a '=' for specifying an exact version.
  GAP := "4.8.6",

  # list of pairs [package name, version], package name is case
  # insensitive, exact version denoted with '=' prepended to version string.
  # without these, the package will not load
  NeededOtherPackages := [["GAPDoc", "1.5"],["cvec","2.5.6"]],

  # list of pairs [package name, version] as above,
  # these package are will be loaded if they are available,
  # but the current package will be loaded if they are not available
  SuggestedOtherPackages := [],

  # *Optional*: a list of pairs as above, denoting those needed packages
  # that must be completely loaded before loading of the current package
  # is started (if this is not possible due to a cyclic dependency
  # then the current package is regarded as not loadable);
  # this component should be used only if functions from the needed packages
  # in question are called (or global lists or records are accessed)
  # while the current package gets loaded
  # OtherPackagesLoadedInAdvance := [],

  # needed external conditions (programs, operating system, ...)  provide 
  # just strings as text or
  # pairs [text, URL] where URL  provides further information
  # about that point.
  # (no automatic test will be done for this, do this in your 
  # 'AvailabilityTest' function below)
  ExternalConditions := [],
),

##  Provide a test function for the availability of this package.
##  For packages containing nothing but GAP code, just say 'ReturnTrue' here.
##  For packages which may not work or will have only partial functionality,
##  use 'LogPackageLoadingMessage( PACKAGE_WARNING, ... )' statements to
##  store messages which may be viewed later with `DisplayPackageLoadingLog'.
##  Do not call `Print' or `Info' in the `AvailabilityTest' function of the 
##  package.
##
##  With the package loading mechanism of GAP >=4.4, the availability
##  tests of other packages, as given under .Dependencies above, will be 
##  done automatically and need not be included in this function.
##
AvailabilityTest := ReturnTrue,

##  *Optional*: path relative to package root to a file which 
##  shall be read immediately before the package is loaded.
#PreloadFile := "...",

##  *Optional*, but recommended: path relative to package root to a file which 
##  contains as many tests of the package functionality as sensible.
##  The file can either consist of 'ReadTest' calls or it is itself read via
##  'ReadTest'; it is assumed that the latter case occurs if and only if
##  the file contains the string 'gap> START_TEST('.
##  For deposited packages, these tests are run regularly, as a part of the
##  standard GAP test suite.
TestFile := "tst/testall.tst",

##  *Optional*: Here you can list some keyword related to the topic 
##  of the package.
Keywords := ["Frobenius", "projective linear transformation", "positive characteristic"]

));

