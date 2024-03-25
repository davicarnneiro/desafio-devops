FROM python:3.9-slim

# Define o diretório de trabalho na imagem
WORKDIR /app

# Copia o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
RUN pip install -r requirements.txt

# Copia o restante do código para o diretório de trabalho
COPY . .

# Comando para iniciar a aplicação
CMD ["python", "run.py"]
