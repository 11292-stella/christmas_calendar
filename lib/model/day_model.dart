// Questa classe rappresenta un singolo "giorno" del Calendario dell’Avvento.
class DayModel {
  // Costruttore della classe.
  const DayModel(
    this.day, // numero del giorno (1–24)
    this.titolo, // titolo della sorpresa
    this.descrizione, // descrizione breve del contenuto
    this.immagine, // percorso dell'immagine associata
    this.unlocked, // indica se il giorno è sbloccato o no
  );

  final int day;
  final String titolo;
  final String descrizione;
  final String immagine;
  final bool unlocked;

  //Questa classe è la scheda tecnica di ogni giorno del calendario.
  //Ogni bottone del calendario leggerà i dati da un oggetto DayModel
}
