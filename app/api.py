from flask import Flask, jsonify, request

app_name = 'comentarios'
app = Flask(app_name)
app.debug = True

# Dicionário para armazenar os comentários, onde a chave é o content_id e o valor é uma lista de comentários
comments = {}


@app.route('/api/comment/new', methods=['POST'])
def api_comment_new():
    # Extrai os dados do corpo da requisição
    request_data = request.get_json()

    # Verifica se os campos obrigatórios estão presentes no corpo da requisição
    if 'email' not in request_data or 'comment' not in request_data or 'content_id' not in request_data:
        return jsonify({'status': 'ERROR', 'message': 'Missing required fields'}), 400

    # Extrai os dados da requisição
    email = request_data['email']
    comment = request_data['comment']
    content_id = str(request_data['content_id'])

    # Cria um novo comentário
    new_comment = {'email': email, 'comment': comment}

    # Verifica se já existem comentários para esse content_id
    if content_id in comments:
        comments[content_id].append(new_comment)
    else:
        comments[content_id] = [new_comment]

    # Retorna uma resposta de sucesso
    return jsonify({'status': 'SUCCESS', 'message': 'Comment created and associated with content_id {}'.format(content_id)})


@app.route('/api/comment/list/<content_id>')
def api_comment_list(content_id):
    # Converte o content_id para string
    content_id = str(content_id)

    # Verifica se existem comentários para o content_id especificado
    if content_id in comments:
        return jsonify(comments[content_id])
    else:
        # Retorna uma mensagem de erro se não houver comentários para o content_id especificado
        return jsonify({'status': 'NOT-FOUND', 'message': 'content_id {} not found'.format(content_id)}), 404


@app.route('/api/comment/list/all')
def api_comment_list_all():
    # Retorna todos os comentários
    return jsonify(comments)


if __name__ == '__main__':
    app.run()
