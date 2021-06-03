class JourFermeture {
  String jouId;
  String etaId;
  DateTime jouDate;

  JourFermeture() {
    jouId = '';
  }

  JourFermeture.fromJson(Map<String, dynamic> json)
      : etaId = json['etaId'],
        jouId = json['jouId'],
        jouDate = json['jouDate'];
}
