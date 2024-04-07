import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TelaInicial(),
        '/segunda': (context) => TelaControles(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAB LAB controle protótipo'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/imagem/braco_robotico.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/segunda');
                  },
                  child: Text('Iniciar'),
                ),
              ],
            ),
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.black54,
                child: Text(
                  'Controle protótipo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaControles extends StatefulWidget {
  @override
  _TelaControlesState createState() => _TelaControlesState();
}

class _TelaControlesState extends State<TelaControles> {
  final TextEditingController _direitaController = TextEditingController();
  final TextEditingController _esquerdaController = TextEditingController();
  final TextEditingController _articulacao1Controller = TextEditingController();
  final TextEditingController _articulacao2Controller = TextEditingController();
  final TextEditingController _articulacao3Controller = TextEditingController();
  final TextEditingController _garraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controles do Braço Robótico'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _direitaController,
              decoration: InputDecoration(labelText: 'Direita (0 - 180)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _esquerdaController,
              decoration: InputDecoration(labelText: 'Esquerda (0 - 180)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _articulacao1Controller,
              decoration: InputDecoration(labelText: 'Articulação 1 (0 - 360)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _articulacao2Controller,
              decoration: InputDecoration(labelText: 'Articulação 2 (0 - 360)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _articulacao3Controller,
              decoration: InputDecoration(labelText: 'Articulação 3 (0 - 360)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _garraController,
              decoration: InputDecoration(labelText: 'Garra (Abrir-1  Fechar-0)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Verifica se todos os campos foram preenchidos
                if (_direitaController.text.isNotEmpty &&
                    _esquerdaController.text.isNotEmpty &&
                    _articulacao1Controller.text.isNotEmpty &&
                    _articulacao2Controller.text.isNotEmpty &&
                    _articulacao3Controller.text.isNotEmpty &&
                    _garraController.text.isNotEmpty) {
                 
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Operação Finalizada'),
                        content: Text('Valores enviados: \n'
                            'Direita: ${_direitaController.text}\n'
                            'Esquerda: ${_esquerdaController.text}\n'
                            'Articulação 1: ${_articulacao1Controller.text}\n'
                            'Articulação 2: ${_articulacao2Controller.text}\n'
                            'Articulação 3: ${_articulacao3Controller.text}\n'
                            'Garra: ${_garraController.text}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Caso algum campo esteja vazio, exibe uma mensagem
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Todos os campos devem ser preenchidos.'),
                    ),
                  );
                }
              },
              child: Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}
