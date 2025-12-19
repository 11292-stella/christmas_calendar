import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    //anche qui riusiamo Scaffold per creare la base della nuova pagina
    //qui possiamo aggiungere AppBar, modificare il body ecc..
    return Scaffold(
      appBar: AppBar(
        //titolo dell' AppBarr
        title: Text(
          'Advent Calendar !',
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
        //ombra sotto l'AppBAr
        elevation: 1,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 24,
          itemBuilder: (context, index) {
            final day = index + 1;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text(
                '$day',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
