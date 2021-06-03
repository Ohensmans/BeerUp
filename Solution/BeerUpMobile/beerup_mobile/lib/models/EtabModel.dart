class Etablissement {
  String etaId;
  String orgId;
  String typEtaId;
  String etaNom;
  String etaTva;
  String etaRue;
  String etaNum;
  String etaCp;
  String etaVille;
  String etaPays;
  String etaEmail;
  String etaWeb;
  String etaPhoto;
  int etaNbVu;
  String etaCoordLong;
  String etaCoordLat;
  bool etaActif;
  bool estOuvert;
  double distance;
  String nomTypeEta;
  bool estJourFermeture;

  Etablissement() {
    etaNom = '';
  }

  Etablissement.fromJson(Map<String, dynamic> json)
      : etaId = json['etaId'],
        orgId = json['orgId'],
        typEtaId = json['typEtaId'],
        etaNom = json['etaNom'],
        etaTva = json['etaTva'],
        etaRue = json['etaRue'],
        etaNum = json['etaNum'],
        etaCp = json['etaCp'],
        etaVille = json['etaVille'],
        etaPays = json['etaPays'],
        etaEmail = json['etaEmail'],
        etaWeb = json['etaWeb'],
        etaPhoto = json['etaPhoto'],
        etaNbVu = json['etaNbVu'],
        etaCoordLong = json['etaCoordLong'],
        etaCoordLat = json['etaCoordLat'],
        distance = json['distance'].toDouble(),
        estOuvert = json['estOuvert'] == 'true',
        etaActif = json['etaActif'] == 'true',
        nomTypeEta = json['nomTypeEta'];
}
