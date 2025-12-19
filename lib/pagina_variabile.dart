import 'package:flutter/material.dart';
import 'package:my_personal_app/pagina_iniziale.dart';

// Questa è la ROOT del progetto.
// Qui decidiamo quale pagina mostrare (start, quiz, results...).
// La rendiamo StatefulWidget perché lo stato deve cambiare.
// Dentro assegniamo MaterialApp e il colore di sfondo.
// In seguito qui comporremo le varie schermate.

class PaginaVariabile extends StatefulWidget {
  const PaginaVariabile({super.key});

  @override
  State<PaginaVariabile> createState() {
    return _PaginaVariabileState();
  }
}

class _PaginaVariabileState extends State<PaginaVariabile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 25, 25, 112),
                Color.fromARGB(255, 175, 64, 255),
                Color.fromARGB(255, 219, 234, 246),
              ],
              center: Alignment.bottomRight, //parte dal centro
              radius: 1.9, //quanto si espande(0.0 = piccolo, 1.o = pieno)
            ),
          ),
          // Qui costruiamo il contenuto principale dell’app.
          // Dentro il Container (che gestisce lo sfondo) inseriamo la PaginaIniziale,
          // cioè la schermata che mostra l’immagine e il testo introduttivo.
          // PaginaIniziale verrà mostrata sopra il gradiente di sfondo.
          child: PaginaIniziale(),
        ),
      ),
    );
  }
}
