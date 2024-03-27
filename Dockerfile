# Use a imagem base do Python
FROM python:3.9

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos de aplicação para o diretório de trabalho
COPY . .

# Instale as dependências
RUN pip install -r ./requirements.txt

# Exponha a porta em que sua aplicação Flask está sendo executada
EXPOSE 5000

# Comando para executar a aplicação quando o contêiner for iniciado
CMD ["python", "api.py"]