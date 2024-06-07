import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

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
        title: const Text('Ejercicio 02'),
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTktgsTXtk8QXfj0knBVpFLPJHMShIotrUYtg&s',
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "palo1988",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        CampoVelocidad(),
        BotonCalcular(context)
      ],
    ),
  );
}

final TextEditingController _velocidadAng = TextEditingController();
// ignore: non_constant_identifier_names
Widget CampoVelocidad() {
  return (TextField(
    controller: _velocidadAng,
    decoration: const InputDecoration(hintText: "ingrese velocidad angular"),
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
  double radianesSec = double.tryParse(_velocidadAng.text) ?? 0.0;
  double tiempo = 25;
  return radianesSec * tiempo;
}

void alerta(context) {
  showDialog(
      context: context,
      builder: (context) {
        return (AlertDialog(
          title: const Text("Resultado"),
          content: Text("La distancia recorrida es : ${calcular()}"),
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
