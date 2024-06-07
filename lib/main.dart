import 'package:flutter/material.dart';
import 'package:prueba1_app/screens/Ejercicio01.dart';
import 'package:prueba1_app/screens/Ejercicio02.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

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
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Cuerpo(context), Ejercicio01()];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pablo Rosero'),
        ),
        body: screens[indice],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            setState(() {
              indice = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.abc_sharp), label: "PRUEBA"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm_outlined), label: "EJERCICIO 01"),
          ],
        ));
  }
}

Widget Cuerpo(context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1wLAkdId4IkZQcLQr7Tb7hrYpCWV30ECA6g&s',
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
        Boton(context)
      ],
    ),
  );
}

Widget Boton(context) {
  return (ElevatedButton(
      onPressed: () {
        alerta02(context);
      },
      child: const Text("Ir al ejercicio 2")));
}

void alerta02(context) {
  showDialog(
      context: context,
      builder: (context) {
        return (AlertDialog(
          title: const Text("desea ir al ejercicio 2"),
          content: const Text("presione si para ir"),
          actions: [
            TextButton(
                onPressed: () {
                  irPantalla(context);
                },
                child: const Text("si")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("no")),
            FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancelar"))
          ],
        ));
      });
}

void irPantalla(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Ejercicio02()));
}
