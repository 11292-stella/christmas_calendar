import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_app/pagina_calendario.dart';

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
              // Quando premi il bottone, vuoi APRIRE una nuova pagina.
              // In Flutter, cambiare pagina si chiama "NAVIGAZIONE" (navigation).

              // Navigator è lo strumento che Flutter usa per:
              // - aprire nuove pagine (push)
              // - tornare indietro (pop)
              // - sostituire pagine (pushReplacement)
              // - gestire lo stack delle schermate (come una pila di carte)

              // Ogni volta che apri una nuova pagina, Flutter la METTE sopra la precedente.
              // Quando torni indietro, Flutter la TOGLIE dallo stack.

              // Navigator.push() = aggiunge una nuova pagina sopra quella attuale.
              onPressed: () {
                Navigator.push(
                  context, // Il "context" dice a Flutter DOVE sei nella tua app.
                  // Serve per sapere da quale pagina stai navigando.

                  // MaterialPageRoute è la STRADA (route) che porta alla nuova pagina.
                  // Dice a Flutter:
                  // - come animare il passaggio
                  // - quale widget deve essere mostrato come nuova pagina
                  MaterialPageRoute(
                    builder: (context) => const PaginaCalendario(),
                    // builder: costruisce la NUOVA pagina da mostrare.
                    // Qui stai dicendo: "Quando arrivi su questa route, mostra PaginaCalendario".
                  ),
                );
              },

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