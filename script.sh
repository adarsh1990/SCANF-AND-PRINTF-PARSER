#!/bin/sh
#script.sh: Shell script for Creating the front end for the project applcation  created by :MOHAMED FARAS,ADARSH SINGH,KIRAN UPADHYAYA,RAVI KRISHNA SHARMA

tput clear

cd ~/Desktop/submit



zenity  --info --text="\n\n\n\n\n\nMINI PROJECT APPLICATION\n\nTO CHECK THE SYNTAX FOR \nPRINTF AND SCANF STATEMENTS\n\n\n\n\n\n\n"  --title="MINI PARSER FOR SCANF & PRINTF" --height=200

          

while true

do        

	

         	if zenity --question --text="\n\n\nEnter Your Choice of Input Specification:\n\n\nSelect OK To Specify File Input\nSeclect Cancle To Type Input Into A Editor " --title="CHOOSE THE TYPE OF INPUT"; then
         	
         	
         	
         	zenity  --info --text="\n\n\n\n\nPlease Select The File To Be Input\n\n\n" --title="SELECT THE INPUT FILE"  
                szSavePath=`zenity --file-selection --title="SELECT THE INPUT FILE"`

        case $? in
                 
                 0)
                       zenity  --info --text="\n\n\n\nThe Input File Selected is :				\n\n\n$szSavePath\n\n\n		"  --title="INPUT FILE SELECTED ";
	
			zenity --text-info --width=600 --height=500 --editable --filename="$szSavePath"> temp.edited --title="FILE CONTENTS ARE"
			
			rm "$szSavePath"
			mv temp.edited "$szSavePath"

                       if [ ! -s "$szSavePath" ] ; then 
                       
                       
                       zenity --warning --text="\n\n\nThe file selected is empty.\n\nPlease select a different file.\n\n"
                       continue
                       
                       fi
                       ;;
                       
                 
                 1)
                        zenity --warning --text "\n\n\nCancle input file selected\n\nPlease try again\n\n"
                        
                        if zenity --question --text="\n\n\nDo you want specify an input file ?\n\nPress OK to specify the file\n\nPress Cancle to exit \n\n" --title="INVALID INPUT FILE";then continue
                        
                        else      

				break
		
			fi
               
          esac
                
               
                lex -l pns.l
          	yacc -d pns.y
        	cc lex.yy.c y.tab.c -ll 
          	szResult=$(./a.out "$szSavePath");
         	
		(i=0
		while [ $i -lt 101 ]
		do
		echo $i
		i=`expr $i + 1`
		sleep 0.03
		done ) | zenity --progress --width=400 --text="Parsing"

		zenity  --info --text="\n\n\n\nINPUT FILE :\n\n $szSavePath \n\n\n\n\n\n\nRESULT :$szResult\n\n\n" --title="PARSING COMPLETED" --height=400

		
		if zenity --question \
         		  --text="\n\n\n\nDo You Want To re-run the Analyzer with different input file\n\n\nPress OK to do so\nPress Cancle to Exit" --title="DO YOU WANT TO CONTINUE?"; then continue
          
		elif zenity --question \
         		  --text="\n\n\n\nDo You Want to see the report \n\n\nPress OK to do so\nPress Cancle to Exit" --title="DO YOU WANT TO CONTINUE?";then

			cd
			cd ~/Desktop/submit
			evince report.pdf
			break
			
		else
			break
		
		fi
	
	
		
	else 
	
	rm ~/Desktop/submit/sample.c
	
	tput clear

	cd
	cd ~/Desktop/submit

	zenity --text-info --width=400 --editable --filename="sample.c" > sample.edited --title sample.c
	rm sample.c
	mv sample.edited sample.c
        
        if [ -s "sample.c" ] ; then 

		zenity --info --text="Input is given to the parser"	
        
		lex -l pns.l
          	yacc -d pns.y
        	cc lex.yy.c y.tab.c -ll 
          	szResult=$(./a.out sample.c);
		
		(i=0
		while [ $i -lt 101 ]
		do
		echo $i
		i=`expr $i + 1`
		sleep 0.03
		done ) | zenity --progress --width=400  --text="Parsing..."        	

		zenity  --info --text="\n\n\n\nINPUT FILE :\n\n ~/Desktop/submit/sample.c \n\n\n\n\n\n\nRESULT :$szResult\n\n\n" --title="PARSING COMPLETED"
		
		if zenity --question \
         		  --text="\n\n\n\nDo You Want To re-run the Analyzer with different input file\n\n\nPress OK to do so\nPress Cancle to Exit" --title="DO YOU WANT TO CONTINUE?"; then continue
          
		elif zenity --question \
         		  --text="\n\n\n\nDo You Want to see the report \n\n\nPress OK to do so\nPress Cancle to Exit" --title="DO YOU WANT TO CONTINUE?";then
						
			cd
			cd ~/Desktop/submit
			evince report.pdf
			break
		else
			break
		
		fi

                       
                else 
                zenity --warning --text="\n\n\nThe selected file is empty.\n\nPlease select a different file.\n\n"
                continue
                fi
                       

  
	fi		       	
		

done

zenity  --info --text="\n\n\n\nTECHNICAL GUIDE  :   Ms. Trishiladevi Nagavi\n\n\n\nDEVELOPED BY  :\n\nKIRAN N UPADHYAYA\nADARSH SINGH M\nMOHAMED FARAS\nRAVI KRISHNA SHARMA\n\n\n\nThank You For Using The Mini Application\n\n\n\n." --title="Credits" 


rm ~/Desktop/submit/a.out
rm ~/Desktop/submit/lex.yy.c
rm ~/Desktop/submit/y.tab.c
rm ~/Desktop/submit/y.tab.h
rm ~/Desktop/submit/sample.c






