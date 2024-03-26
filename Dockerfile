# Use a imagem base do Python
FROM python:3.9-slim

# Define o diretório de trabalho na imagem
WORKDIR /app

# Copia todo o conteúdo do diretório 'app' local para o diretório de trabalho no contêiner
COPY app/ .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Comando para iniciar a aplicação
CMD ["python", "api.py"]
