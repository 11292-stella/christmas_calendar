import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_app/data/calendar_data.dart';
import 'package:my_personal_app/model/day_model.dart';
import 'day_card.dart';

class PaginaCalendario extends StatefulWidget {
  const PaginaCalendario({super.key});

  @override
  State<PaginaCalendario> createState() {
    return _PaginaCalendarioState();
  }
}

//questa classe contiene lo stato della pagina
//da qui gestiamo la UI e gestiamo eventuali cambiamenti
class _PaginaCalendarioState extends State<PaginaCalendario> {
  DayModel? selectedDay;

  @override
  Widget build(BuildContext context) {
    //anche qui riusiamo Scaffold per creare la base della nuova pagina
    //qui possiamo aggiungere AppBar, modificare il body ecc..
    return Scaffold(
      appBar: AppBar(
        //titolo dell' AppBarr
        title: Text(
          'Advent Calendar !',
          //style testo appBar
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
        //centriamo il titolo dell'AppBar
        centerTitle: true,
        // Ombra sotto l'AppBar: più alto è il valore, più l'AppBar sembra "sollevata"
        elevation: 8,
        // flexibleSpace permette di personalizzare completamente lo sfondo dell'AppBar
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            // Arrotonda SOLO gli angoli inferiori dell'AppBar
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),

            // RadialGradient = gradiente circolare che parte dal centro
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 25, 25, 112),
                Color.fromARGB(255, 175, 64, 255),
                Color.fromARGB(255, 219, 234, 246),
              ],
              center: Alignment.center, //parte dal centro
              radius: 3.0, //quanto si espande
            ),

            // boxShadow aggiunge un'ombra al contenitore dell'AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 12,
                spreadRadius: -4,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
      ),

      // Il corpo della pagina
      body: Container(
        //sfondo della pagina
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 25, 25, 112),
              Color.fromARGB(255, 175, 64, 255),
              Color.fromARGB(255, 219, 234, 246),
            ],
            center: Alignment.centerRight,
            radius: 1.4,
          ),
        ),

        child: Column(
          children: [
            // ✅ GRIGLIA DEL CALENDARIO
            Expanded(
              flex: 2,
              child: Padding(
                // Padding esterno per non far toccare la griglia ai bordi dello schermo
                padding: const EdgeInsets.all(16.0),

                // GridView.builder crea una griglia dinamica
                child: GridView.builder(
                  // SliverGridDelegateWithFixedCrossAxisCount definisce:
                  // - quante colonne
                  // - spazi orizzontali e verticali
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 colonne → perfetto per 24 giorni
                    crossAxisSpacing: 12, // spazio orizzontale tra i bottoni
                    mainAxisSpacing: 12, // spazio verticale tra i bottoni
                  ),

                  // Numero totale di elementi nella griglia
                  itemCount: 24, // 24 giorni dell’avvento
                  // itemBuilder costruisce ogni singolo bottone della griglia
                  itemBuilder: (context, index) {
                    // index parte da 0 → aggiungiamo 1 per avere 1–24
                    final day = index + 1;

                    //ritorna un bottone
                    return Container(
                      //Il Container gestisce TUTTA la parte grafica del bottone:
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 210, 228, 255),
                            Color.fromARGB(255, 160, 180, 255),
                            Color.fromARGB(255, 130, 90, 200),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        //Arrotonda gli angoli del bottone
                        borderRadius: BorderRadius.circular(20),
                        //Ombra esterna per dare profondità (effetto 3D)
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),

                      //Material serve per far funzionare l’effetto “splash” dell’InkWell
                      child: Material(
                        color: Colors.transparent,

                        //InkWell è la parte cliccabile del bottone
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),

                          onTap: () {
                            //azione futura del bottone
                            setState(() {
                              selectedDay = elementi[index];
                            });
                          },

                          //Center centra il numero dentro la cella
                          child: Center(
                            child: Text(
                              '$day',
                              style: GoogleFonts.cinzelDecorative(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.blueAccent,
                                    offset: Offset(3, 3),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            //CARD DEL GIORNO SELEZIONATO
            if (selectedDay != null)
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DayCard(
                    day: selectedDay!,
                    onClose: () {
                      setState(() {
                        selectedDay = null;
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
