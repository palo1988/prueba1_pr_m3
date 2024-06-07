import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 01'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          'https://img.freepik.com/foto-gratis/arreglo-guitarra-blanca-vista-superior-espacio-copia_23-2148785744.jpg',
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Github nick: palo1988",
          style: TextStyle(
            color: Color.fromARGB(255, 87, 50, 221),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        CampoAlturaInicial(),
        CampoTiempo(),
        BotonCalcular(context)
      ],
    ),
  );
}

final TextEditingController _alturaIni = TextEditingController();
final TextEditingController _tiempo = TextEditingController();
// ignore: non_constant_identifier_names
Widget CampoAlturaInicial() {
  return (TextField(
    controller: _alturaIni,
    decoration: const InputDecoration(hintText: "ingrese altura inicial"),
  ));
}

Widget CampoTiempo() {
  return (TextField(
    controller: _tiempo,
    decoration: const InputDecoration(hintText: "ingrese tiempo"),
  ));
}

// ignore: non_constant_identifier_names
Widget BotonCalcular(context) {
  return (FilledButton(
      onPressed: () {
        alerta(context);
      },
      child: const Text("calcular")));
}

double calcular() {
  double alturaI = double.tryParse(_alturaIni.text) ?? 0.0;
  double tiempo = double.tryParse(_tiempo.text) ?? 0.0;

  double aceleracionMed = 20 * 0.5 * tiempo * tiempo;
  double alturaFin = alturaI + aceleracionMed;
  return alturaFin;
}

void alerta(context) {
  if (calcular() >= 1000) {
    showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: const Text("Resultado"),
            content:
                Text("Lanzamiento exitoso La altura final es : ${calcular()}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"))
            ],
          ));
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: const Text("Resultado"),
            content:
                Text("Lanzamiento fallido La altura final es : ${calcular()}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"))
            ],
          ));
        });
  }
}
