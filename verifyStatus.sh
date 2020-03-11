# find .        	Busca en el directorio actual.
# -name "*"     	Busca todos los archivos
# -type         	de tipo 
# f             	file
# d             	directory
# |             	pipe
# sort -n -r    	ordena los archivos con opcion -n -r
# -maxdepth 1			files or directories of the current directory
# while read    	mientras lea todos los parametros que encuentra find, hace lo posterior.
# -f "$GITIGNORE"	verify if the file exit
# ! -f "GITIGNORE" verify if the file does not exist				

find . -name "*" -type d -maxdepth 1 | while read directoryName

do
	GLOBAL_DIRECTORYNAME=/Users/carlossantiagocruz/SWIFT-PROGRAMMING/$directoryName/

	cd $GLOBAL_DIRECTORYNAME
	
	validateStatusString=`git status | grep "untracked" | tail -1`

	if [[  $validateStatusString == *"untracked"* ]]
	then
			echo "$directoryName is untracked"
	fi
done

