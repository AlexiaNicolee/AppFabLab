import 'package:flutter/material.dart';

import 'package:untitled/pages/tela_controles.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAB_LAB: Controle do Protótipo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[400],
        centerTitle: true,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaControles()),
                    );
                  },
                  child: Text('Iniciar'),
                  style: ElevatedButton.styleFrom(

                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top +
                  kToolbarHeight +
                  20, // Ajuste da distância
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.green[200],
                child: Text(
                  'Controle protótipo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Cor do fundo da tela
    );
  }
}
