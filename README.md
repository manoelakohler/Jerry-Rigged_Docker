# Dockerfiles

Criar docker linux em windows: 
- botão direto no ícone do docker desktop na bandeja de serviços em execução
- switch to linux container

Criar imagem:

`cd <Dockerfile path>`

`docker build -t <image_name> .`

Criar e executar container:

`docker run -it <image>`

ou

`docker run <image>`

Iniciar container:

`docker start <container>`

Iniciar container e abrir CLI:

`docker exec -it <container> /bin/bash`
