# Use a imagem base do Python
FROM python:3.9-slim

# Define o diretório de trabalho na imagem
WORKDIR /app

# Copia o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o arquivo api.py para o diretório de trabalho
COPY api.py .

# Comando para iniciar a aplicação
CMD ["python", "api.py"]


