#!/bin/bash
source ./progress.sh

setup_scroll_area

sleep 1

draw_progress_bar 10

sleep 3
echo "Welcome to Chnage PPD Utility in Ubuntu 20.04"

echo "We can check Status of Running PPD of Generic-PDF_Printer-PDF.ppd"

# Before We do any Chnages in PPD We have to Stop Our Cups Service


if systemctl is-active --quiet cups.service ; then
    
       echo "CUPS is running."
       draw_progress_bar 50
       sleep 1
        echo "Now Cups is Running"

        sudo systemctl stop cups.service

        echo "We are Going to stop the Cups"

        checkppd=`cat /usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd | wc -l`

        echo $checkppd "Value of Check PPD";

        cd /usr/share/ppd/cupsfilters/

        echo "Now i am in $(pwd)"
        FILE=/usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd
            if [ -f "$FILE" ]; then

                echo "$FILE exists."
                rmppd=`sudo rm -rf Generic-PDF_Printer-PDF.ppd`
                echo $rmppd "Valu of RM PPD"
                
             else
               echo "$FILE not exists."

            fi
        
        echo "Copying Generic-PDF_Printer-PDF.ppd "
        sudo sshpass -p "z62DA1keP6"  scp -r -o StrictHostKeyChecking=no  -P35610 sugam@103.148.165.92:/usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd .
        checkppd=`cat /usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd | wc -l`
        echo $checkppd "Value of Check PPD";

        sudo systemctl start cups.service
        sudo systemctl start cups.path


        draw_progress_bar 90
        sleep 3
        destroy_scroll_area

        else
       
        echo "CUPS is not running Good."
         checkppd=`cat /usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd | wc -l`
        echo $checkppd "Value of Check PPD";

        cd /usr/share/ppd/cupsfilters/

        echo "Now i am in $(pwd)"
        rmppd=`sudo rm -rf Generic-PDF_Printer-PDF.ppd`
        echo $rmppd "Valu of RM PPD"

        echo "Copying Generic-PDF_Printer-PDF.ppd "
        sudo sshpass -p "z62DA1keP6"  scp -r -o StrictHostKeyChecking=no  -P35610 sugam@103.148.165.92:/usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd .
        checkppd=`cat /usr/share/ppd/cupsfilters/Generic-PDF_Printer-PDF.ppd | wc -l`
        echo $checkppd "Value of Check PPD";
        sudo systemctl start cups.service
        sudo systemctl start cups.path

        draw_progress_bar 90
        sleep 3
        destroy_scroll_area
fi







