import 'package:flutter/material.dart';

class TelaControles extends StatefulWidget {
  @override
  _TelaControlesState createState() => _TelaControlesState();
}

class _TelaControlesState extends State<TelaControles> {
  double _direita = 90;
  double _esquerda = 90;
  double _articulacao1 = 180;
  double _articulacao2 = 180;
  double _articulacao3 = 180;
  bool _garra = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Controle do Braço Robótico',
          style: TextStyle(color: Colors.white), // Cor do texto do título
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple [400], // Cor do fundo do AppBar
        iconTheme: IconThemeData(color: Colors.white), // Cor da seta do AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSliderWithInput("Direita (0 - 180)", _direita),
            _buildSliderWithInput("Esquerda (0 - 180)", _esquerda),
            _buildSliderWithInput("Articulação 1 (0 - 360)", _articulacao1),
            _buildSliderWithInput("Articulação 2 (0 - 360)", _articulacao2),
            _buildSliderWithInput("Articulação 3 (0 - 360)", _articulacao3),
            _buildGarraSwitch(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Operação Finalizada'),
                      content: Text('Valores enviados: \n'
                          'Direita: $_direita\n'
                          'Esquerda: $_esquerda\n'
                          'Articulação 1: $_articulacao1\n'
                          'Articulação 2: $_articulacao2\n'
                          'Articulação 3: $_articulacao3\n'
                          'Garra: ${_garra ? 'Fechar (1)' : 'Abrir (0)'}'),
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
              },
              child: Text('Finalizar'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Cor do fundo da tela
    );
  }

  Widget _buildSliderWithInput(String label, double value) {
    TextEditingController controller =
    TextEditingController(text: value.toStringAsFixed(0));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrito
            fontSize: 16, // Tamanho da fonte
            color: Colors.blueGrey[900], // Cor do texto
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                min: 0,
                max: label.contains('180') ? 180 : 360,
                divisions: label.contains('180') ? 180 : 360,
                onChanged: (newValue) {
                  setState(() {
                    if (label.contains('Direita')) {
                      _direita = newValue;
                    } else if (label.contains('Esquerda')) {
                      _esquerda = newValue;
                    } else if (label.contains('Articulação 1')) {
                      _articulacao1 = newValue;
                    } else if (label.contains('Articulação 2')) {
                      _articulacao2 = newValue;
                    } else if (label.contains('Articulação 3')) {
                      _articulacao3 = newValue;
                    }
                    controller.text = newValue.toStringAsFixed(0);
                  });
                },
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                onChanged: (newValue) {
                  if (newValue.isNotEmpty) {
                    double newValueDouble = double.parse(newValue);
                    if (newValueDouble >= 0 &&
                        newValueDouble <= (label.contains('180') ? 180 : 360)) {
                      setState(() {
                        if (label.contains('Direita')) {
                          _direita = newValueDouble;
                        } else if (label.contains('Esquerda')) {
                          _esquerda = newValueDouble;
                        } else if (label.contains('Articulação 1')) {
                          _articulacao1 = newValueDouble;
                        } else if (label.contains('Articulação 2')) {
                          _articulacao2 = newValueDouble;
                        } else if (label.contains('Articulação 3')) {
                          _articulacao3 = newValueDouble;
                        }
                      });
                    }
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGarraSwitch() {
    return Row(
      children: [
        Text(
          'Garra (Abrir-1  Fechar-0)',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrito
            fontSize: 16, // Tamanho da fonte
            color: Colors.blueGrey[900], // Cor do texto
          ),
        ),
        SizedBox(width: 20),
        Switch(
          value: _garra,
          onChanged: (value) {
            setState(() {
              _garra = value;
            });
          },
          activeColor: Colors.deepPurple[600], // Cor do botão quando ativado
        ),
      ],
    );
  }
}
