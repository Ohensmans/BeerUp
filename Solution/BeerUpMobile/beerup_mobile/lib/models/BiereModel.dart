class Biere {
  String bieId;
  String etaId;
  String typBieId;
  String bieNom;
  String bieDesc;
  String biePhoto;
  int bieNbVu;
  DateTime bieDateCre;
  bool bieValide;
  bool bieActif;
  double bieDegreAlcool;
  String userId;

  Biere() {
    bieNom = 'not found';
    bieDesc = 'not found';
    biePhoto =
        'http://192.168.179.134:5001/resources/images/no_image_available.png';
  }

  Biere.fromJson(Map<String, dynamic> json)
      : bieId = json['bieId'],
        etaId = json['etaId'],
        typBieId = json['typBieId'],
        bieNom = json['bieNom'],
        bieDesc = json['bieDesc'],
        biePhoto = json['biePhoto'],
        bieNbVu = json['bieNbVu'],
        bieDateCre = DateTime.parse(json['bieDateCre']),
        bieValide = json['bieValide'] == 'true',
        bieActif = json['bieActif'] == 'true',
        bieDegreAlcool = json['bieDegreAlcool'],
        userId = json['userId'];
}
