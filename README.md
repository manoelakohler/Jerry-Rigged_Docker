# Dockerfiles

Alguns códigos úteis para uma gambiarra de rodar um código linux em uma máquina windows, iniciando o docker via python, passando parâmetros dinâmicos via código e mapeando diretórios passados pelo usuário para salvar resultados de execução e também acesso por parte do docker linux.

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
