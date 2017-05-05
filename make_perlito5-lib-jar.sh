
make clean
rm perlito5-lib.jar
rm -rf org

perl perlito5.pl --bootstrapping --bootstrap_java_eval -Isrc5/lib -Cjava src5/util/perlito5-javalib.pl > perlito5-javalib.java

mkdir org
mkdir org/perlito
mkdir org/perlito/Perlito5

perl make_perlito5-lib-jar_.pl perlito5-javalib.java

# cp src5/java/PlJavaCompiler.java org/perlito/Perlito5/

time javac -J-Xms2000m -J-Xmx2000m -J-Xss2000m -source 7 org/perlito/Perlito5/LibPerl.java 
jar -cfe perlito5-lib.jar org.perlito.Perlito5.LibPerl org/perlito/Perlito5/*.class

# time javac -J-Xms2000m -J-Xmx2000m -J-Xss2000m -source 7 -cp perlito5-lib.jar org/perlito/Perlito5/PlJavaCompiler.java
# rm perlito5-lib.jar
# jar -cfe perlito5-lib.jar org.perlito.Perlito5.LibPerl org/perlito/Perlito5/*.class
# rm -rf org

