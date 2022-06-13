@echo off

echo Verificando a existência de imagens ou containers com o mesmo nome...
docker stop manntis_viz
docker rm manntis_viz
docker rmi manntis:latest

echo Criando imagem...
docker build -t manntis:latest .

docker tag manntis:latest manoelakohler/manntis:latest
@REM docker push manoelakohler/manntis:latest

echo Criando container manntis_viz...
docker run -d -it --name manntis_viz -p 0.0.0.0:5000:5000 --mount type=bind,source="D:\MANNTIS\manntis_visualization\models"/classification,target="/D/MANNTIS/manntis_visualization/models/classification/" --mount type=bind,source="D:\MANNTIS\manntis_visualization"/videos,target="/D/MANNTIS/manntis_visualization/videos/" --mount type=bind,source="D:\MANNTIS\manntis_visualization"/results,target="/D/MANNTIS/manntis_visualization/results/" --mount type=bind,source="D:\MANNTIS\manntis_visualization\models"/detection,target="/D/MANNTIS/manntis_visualization/models/detection" manntis:latest

echo Executando app no container...
@REM docker exec -it manntis_viz /bin/bash
start docker exec manntis_viz python video_slider.py
start open_browser.bat

@REM echo Parando o container...
@REM docker stop manntis_viz

echo.
PAUSE


