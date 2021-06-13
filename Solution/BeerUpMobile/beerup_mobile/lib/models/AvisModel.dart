class Avis {
  String bieId;
  double acidMoyen;
  double cafeMoyen;
  double caraMoyen;
  double fruitMoyen;
  double houbMoyen;
  double maltMoyen;
  double sucrMoyen;
  double amerMoyen;
  double noteMoyen;

  Avis() {
    bieId = '';
    cafeMoyen = 0;
    acidMoyen = 0;
    caraMoyen = 0;
    fruitMoyen = 0;
    houbMoyen = 0;
    maltMoyen = 0;
    sucrMoyen = 0;
    amerMoyen = 0;
    noteMoyen = 0;
  }

  Avis.fromJson(Map<String, dynamic> json)
      : bieId = json['bieId'],
        cafeMoyen = json['cafeMoyen'].toDouble(),
        acidMoyen = json['acidMoyen'].toDouble(),
        caraMoyen = json['caraMoyen'].toDouble(),
        fruitMoyen = json['fruitMoyen'].toDouble(),
        houbMoyen = json['houbMoyen'].toDouble(),
        maltMoyen = json['maltMoyen'].toDouble(),
        sucrMoyen = json['sucrMoyen'].toDouble(),
        amerMoyen = json['amerMoyen'].toDouble(),
        noteMoyen = json['noteMoyen'].toDouble();

  Map<String, dynamic> avisToJson() => <String, dynamic>{
        'bieId': bieId,
        'cafeMoyen': cafeMoyen,
        'acidMoyen': acidMoyen,
        'caraMoyen': caraMoyen,
        'fruitMoyen': fruitMoyen,
        'houbMoyen': houbMoyen,
        'maltMoyen': maltMoyen,
        'sucrMoyen': sucrMoyen,
        'amerMoyen': amerMoyen,
        'noteMoyen': noteMoyen,
      };
}
