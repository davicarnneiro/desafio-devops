# FROM python:3.9-slim
# WORKDIR /app
# COPY app/requirements.txt ./
# COPY app/api.py ./
# RUN pip install --no-cache-dir -r requirements.txt
# CMD ["python", "api.py"]


# Use a imagem base do Python
FROM python:3.9

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos de aplicação para o diretório de trabalho
COPY . /app

# Instale as dependências
RUN pip install -r requirements.txt

# Exponha a porta em que sua aplicação Flask está sendo executada
EXPOSE 5000

# Comando para executar a aplicação quando o contêiner for iniciado
CMD ["python", "app.py"]