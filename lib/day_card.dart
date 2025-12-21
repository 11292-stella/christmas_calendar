import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_app/model/day_model.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key, required this.day, required this.onClose});

  final DayModel day;
  //VoidCallback è simile a Function ma è senza parametri e senza volere di ritono
  //fatta apposta per azioni semplici come "chiudi" "premi" "resetta"
  //mentre Function è una funzione generica che può accettare funzioni con parametri, ritorni
  // - VoidCallback è TIPO-SICURO → accetta SOLO funzioni () { ... }
  //- Function è troppo generico → può accettare funzioni con parametri, ritorni, async ecc.
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Ombra della card (più alto = più sollevata)
      elevation: 8,

      // Forma della card → angoli arrotondati
      shape: RoundedRectangleBorder(
        //Arrotondata di 20
        borderRadius: BorderRadius.circular(20),
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //Colore sfondo card
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 210, 228, 255),
              Color.fromARGB(255, 160, 180, 255),
              Color.fromARGB(255, 130, 90, 200),
            ],
            center: Alignment.bottomRight,
            radius: 1.5, //quanto si espande(0.0 = piccolo, 1.o = pieno)
          ),
        ),
        // Padding interno della card
        // EdgeInsets = la misura del padding (16.0)
        padding: const EdgeInsets.all(16.0),

        // Rende la card scrollabile se il contenuto è troppo lungo
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMMAGINE CON ANGOLI ARROTONDATI
              //ClipRRect  è un widget Flutter che serve a ritagliare (clip)
              //un altro widget usando un rettangolo con angoli arrotondati (RRect = Rounded Rectangle).
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  day.immagine, // percorso dell'immagine dal modello
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),

              const SizedBox(height: 20),

              // TITOLO DEL GIORNO
              Text(
                day.titolo,
                style: GoogleFonts.greatVibes(
                  fontSize: 38,
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

              const SizedBox(height: 14),

              // DESCRIZIONE DEL GIORNO
              Text(
                day.descrizione,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  //Aggiungo l'ombreggiatura
                  shadows: [
                    Shadow(
                      color: Colors.deepPurpleAccent,
                      offset: Offset(3, 3),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // BOTTONE "CHIUDI"
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color.fromARGB(255, 25, 25, 112),
                        Color.fromARGB(255, 175, 64, 255),
                        Color.fromARGB(255, 219, 234, 246),
                      ],
                      center: Alignment.bottomRight, //parte dal centro
                      radius:
                          1.9, //quanto si espande(0.0 = piccolo, 1.o = pieno)
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),

                  child: ElevatedButton(
                    onPressed: onClose,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    child: Text(
                      'Chiudi',
                      style: GoogleFonts.cormorantGaramond(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
