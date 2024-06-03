import 'package:app_saude_flutter/cadastro_paciente.dart';
import 'package:flutter/material.dart';
import 'perfil.dart';
import 'consultas.dart';
import 'historico.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Image.asset(
                          'assets/images/ubrela.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      body: const Center(
                        child: Consultas(),
                      ),
                    );
                  },
                ));
              },
              child: SizedBox(
                width: 300,
                height: 100,
                child: Column(children: <Widget>[
                  Center(
                      child: Image.asset(
                    'assets/images/Agendamento.png',
                    width: 60,
                    height: 60,
                  )),
                  const Center(
                    child: Text('Agendar Consulta'),
                  )
                ]),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Image.asset(
                          'assets/images/ubrela.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      body:  Historico(),
                    );
                  },
                ));
              },
              child: SizedBox(
                width: 300,
                height: 100,
                child: Column(children: <Widget>[
                  Center(
                      child: Image.asset(
                    'assets/images/Historico.png',
                    width: 60,
                    height: 60,
                  )),
                  const Center(
                    child: Text('Historico de Consultas'),
                  )
                ]),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Image.asset(
                          'assets/images/ubrela.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      body: Perfil(),
                    );
                  },
                ));
              },
              child: SizedBox(
                width: 300,
                height: 100,
                child: Column(children: <Widget>[
                  Center(
                      child: Image.asset(
                    'assets/images/Perfil.png',
                    width: 60,
                    height: 60,
                  )),
                  const Center(
                    child: Text('Perfil'),
                  )
                ]),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Image.asset(
                          'assets/images/ubrela.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      body: const CadastroPacientes(),
                    );
                  },
                ));
              },
              child: SizedBox(
                width: 300,
                height: 100,
                child: Column(children: <Widget>[
                  Center(
                      child: Image.asset(
                    'assets/images/paciente.png',
                    width: 60,
                    height: 60,
                  )),
                  const Center(
                    child: Text('Cadastrar Paciente'),
                  )
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
