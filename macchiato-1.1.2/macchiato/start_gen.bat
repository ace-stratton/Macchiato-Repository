@echo off
SET JAVAEXE=.\jre\bin\java.exe
SET JARNAME=macchiato.jar

rem delete results from the previous code generation
rmdir /S /Q src-gen-c > nul
rmdir /S /Q src-gen-py > nul
rmdir /S /Q src-gen-js > nul

rem start code generation with the newly prepared JAR containing the correct FIDLs
echo Running C generator without merge option...
%JAVAEXE% -jar %JARNAME% --gen-c .\models\org\endurosat\deploy\deploy_all_default.fdepl
echo Running Python generator...
%JAVAEXE% -jar %JARNAME% --gen-py .\models\org\endurosat\deploy\deploy_all_default.fdepl
echo Running Java Script generator...
%JAVAEXE% -jar %JARNAME% --gen-js .\models\org\endurosat\deploy\deploy_all_default.fdepl

