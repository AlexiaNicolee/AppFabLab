import 'package:flutter/material.dart';
import 'package:untitled/pages/tela_controles.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FabLab_Controle protótipo',
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
                // Adicionando a logo centralizada acima da imagem do braço robótico
                Image.asset(
                  'lib/assets/imagem/logo_ocean.png', // Substitua 'logo.png' pelo nome da sua logo
                  width: 300, // Largura da logo
                  height: 100, // Altura da logo
                ),
                SizedBox(height: 50), // Espaçamento entre a logo e o braço robótico
                Image.asset(
                  'lib/assets/imagem/braco_robotico.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 100), // Espaçamento entre o braço robótico e o botão
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaControles()),
                    );
                  },
                  child: Text(
                    'Iniciar',
                    style: TextStyle(fontSize: 24), // Tamanho do texto do botão
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10), // Aumenta o tamanho do botão
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + kToolbarHeight + 400, // Ajuste da distância
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Text(
                  'Braço robótico',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, //coloca negrito
                    fontSize: 30,
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
