OLD_PID=$(sudo netstat -ltnp | grep -w ':8080' | awk '{print $7}' | cut -d '/' -f1)
if [[ -n "$OLD_PID" ]]; then
  sudo kill -9 "$OLD_PID"
  echo "Old process with PID $OLD_PID has been terminated."
fi
echo $OLD_PID
#
nohup go run main.go >output.log &
#
#NEW_PID=$!
#echo "New process started with PID $NEW_PID."
