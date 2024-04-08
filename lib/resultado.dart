import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;
  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseRerultado {
    if (pontuacao < 8) {
      return 'parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    }
    return 'Novo Jedi!';
  }

  ButtonStyle style = ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseRerultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: reiniciarQuestionario,
            child: Text('Reiniciar?'),
            style: style)
      ],
    );
  }
}
