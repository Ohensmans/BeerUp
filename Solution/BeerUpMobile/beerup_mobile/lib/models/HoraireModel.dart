class Horaire {
  String horId;
  String etaId;
  String horJour;
  String horDebut;
  String horFin;

  Horaire() {
    horId = "";
  }

  Horaire.fromJson(Map<String, dynamic> json)
      : horId = json['horId'],
        etaId = json['etaId'],
        horJour = json['horJour'],
        horDebut = json['horDebut'],
        horFin = json['horFin'];
}
