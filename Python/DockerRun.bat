@echo off

echo Verificando a existência de imagens ou containers com o mesmo nome...
docker stop manntis_viz
docker rm manntis_viz
docker rmi manoelakohler/manntis:latest

echo Baixando imagem...
docker pull manoelakohler/manntis:latest

echo Criando container manntis_viz...
docker run -d -it --name manntis_viz -p 0.0.0.0:5000:5000 --mount type=bind,source="D:\MANNTIS\manntis_visualization\results\classification"/"OUTPUT_CSVS_25_05_2022_16_27_25",target="/D/MANNTIS/manntis_visualization/results/classification/OUTPUT_CSVS_25_05_2022_16_27_25/" --mount type=bind,source="D:\MANNTIS\manntis_visualization\models"/"classification",target="/D/MANNTIS/manntis_visualization/models/classification/" --mount type=bind,source="D:\MANNTIS\manntis_visualization\results\detection"/"OUTPUT_CSVS_26_05_2022_14_13_16",target="/D/MANNTIS/manntis_visualization/results/detection/OUTPUT_CSVS_26_05_2022_14_13_16/" --mount type=bind,source="D:\MANNTIS\manntis_visualization\models"/"detection",target="/D/MANNTIS/manntis_visualization/models/detection/" --mount type=bind,source="D:\MANNTIS\manntis_visualization"/"videos Copy",target="/D/MANNTIS/manntis_visualization/videos Copy/" --mount type=bind,source="D:\MANNTIS\manntis_visualization"/"results",target="/D/MANNTIS/manntis_visualization/results/" --mount type=bind,source="D:\Manoela\CodigoExterno\manntis_visualization\VideoAnalysis"/config.yaml,target="/usr/src/app/VideoAnalysis/config.yaml" manoelakohler/manntis:latest

echo Executando app no container...
@REM docker exec -it manntis_viz /bin/bash
start docker exec manntis_viz python video_slider.py
start open_browser.bat

@REM echo Parando o container...
@REM docker stop manntis_viz

echo.
@REM PAUSE
exit /b


