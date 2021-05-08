class AvisMoyen {
  String bieId;
  double acidMoyen;
  double cafeMoyen;
  double caraMoyen;
  double fruitMoyen;
  double houbMoyen;
  double maltMoyen;
  double sucrMoyen;
  double noteMoyen;

  AvisMoyen() {
    bieId = '';
    cafeMoyen = 0;
    acidMoyen = 0;
    caraMoyen = 0;
    fruitMoyen = 0;
    houbMoyen = 0;
    maltMoyen = 0;
    sucrMoyen = 0;
    noteMoyen = 0;
  }

  AvisMoyen.fromJson(Map<String, dynamic> json)
      : bieId = json['bieId'],
        cafeMoyen = json['cafeMoyen'],
        acidMoyen = json['acidMoyen'],
        caraMoyen = json['caraMoyen'],
        fruitMoyen = json['fruitMoyen'],
        houbMoyen = json['houbMoyen'],
        maltMoyen = json['maltMoyen'],
        sucrMoyen = json['sucrMoyen'],
        noteMoyen = json['noteMoyen'];
}
