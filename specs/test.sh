echo "Initiating tests..."
chmod -R 0777 ./
echo ">>> Docker Lints:"
./specs/opsbox.spec.sh
if [ $? -eq 0 ]; then
  echo ">>> Docker Lints concluded and none failed."
else
  echo ">>> Tests failed."
  exit 1
fi
echo "Initiating DockerHub builds..."
curl --data build=true -X POST 'https://registry.hub.docker.com/u/opsforge/chamilo-docker/trigger/f1769db1-3199-481f-b182-a204e354b710/'
echo "DockerHub build triggered..."
