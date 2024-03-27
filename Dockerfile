# Use a imagem base do Python
FROM python:3.9

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos de aplicação para o diretório de trabalho
COPY app/ ./

# Instale as dependências
RUN pip install -r requirements.txt

# Exponha a porta em que sua aplicação Flask está sendo executada
EXPOSE 5000

# Comando para iniciar a aplicação usando Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "api:app"]
