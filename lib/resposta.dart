import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  ButtonStyle style = ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.blue);
  final void Function() selecionado;
  Resposta(this.texto, this.selecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: selecionado,
        child: Text(texto),
      ),
    );
  }
}
