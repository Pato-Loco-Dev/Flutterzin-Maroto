import 'package:http/http.dart' as http;

Future<void> fetchUserData() async {
  final response = await http.get(Uri.parse('http://localhost:8080/veiculos/veiculos-a-venda'));

  if (response.statusCode == 200) {
    // Se a solicitação for bem-sucedida, você pode processar os dados aqui
    print('Dados recebidos: ${response.body}');
  } else {
    // Se a solicitação falhar, lide com o erro aqui
    print('Falha na solicitação: ${response.statusCode}');
  }
}