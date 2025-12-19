import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaIniziale extends StatelessWidget {
  const PaginaIniziale({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //rende l'immagine ovale
          ClipOval(
            child: Image.asset(
              'assets/images/1.png',
              width: 350,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          //spazio tra immagine e testo
          const SizedBox(height: 60),
          //testo iniziale
          //PER INSTALLARE GOOGLE FONT DIGITA SUL TERMINALE:
          // flutter pub add google_fonts
          Text(
            'Buon Natale!',
            style: GoogleFonts.greatVibes(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              //aggiugniamo l'ombreggiatura al testo
              shadows: [
                Shadow(
                  color: Colors.blueAccent,
                  offset: Offset(3, 3),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Sei pronta a lasciarti avvolgere dallo spirito natalizio? Inoltrati in questo piccolo calendario dell’avvento in formato app, semplice, comodo e pieno di sorprese.',
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              //Aggiungo l'ombreggiatura
              shadows: [
                Shadow(
                  color: Colors.blueAccent,
                  offset: Offset(3, 3),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          //Qui inseriamo il bottone che condurrà alla pagina del calendario,
          //per renderlo più gradevole e modificare il suo aspetto
          //apriamo Container, che contiene tutto il necessario per abbellire il bottone
          Container(
            width: 220,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.deepPurpleAccent],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent,
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Apri il Calendario',
                style: GoogleFonts.cormorantGaramond(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//cinzelDecorative