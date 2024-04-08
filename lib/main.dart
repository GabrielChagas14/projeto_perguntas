import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua música favorita',
      'respostas': [
        {'texto': 'Formation', 'pontuacao': 10},
        {'texto': 'Haunted', 'pontuacao': 6},
        {'texto': 'Heated', 'pontuacao': 4},
        {'texto': 'Cuff It', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual é a seu filme favorito',
      'respostas': [
        {'texto': 'Interestelar', 'pontuacao': 10},
        {'texto': 'Kill Bill', 'pontuacao': 6},
        {'texto': 'Moana', 'pontuacao': 4},
        {'texto': 'Jogos Vorazes', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual é a seu livro favorito',
      'respostas': [
        {'texto': 'Senhor das moscas', 'pontuacao': 10},
        {'texto': 'Extraordinário', 'pontuacao': 6},
        {'texto': 'Duna', 'pontuacao': 4},
        {'texto': 'It: A Coisa', 'pontuacao': 2},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
