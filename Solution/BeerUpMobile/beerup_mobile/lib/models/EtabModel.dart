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

  Etablissement.newOne(String etaNom, String etaId) {
    this.etaNom = etaNom;
    this.etaId = etaId;
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
        distance =
            json['distance'] != null ? json['distance'].toDouble() : null,
        estOuvert = json['estOuvert'] == 'true',
        etaActif = json['etaActif'] == 'true',
        nomTypeEta = json['nomTypeEta'];

  Map<String, dynamic> etabToJson() => <String, dynamic>{
        'etaId': etaId,
        'etaNom': etaNom,
      };
}
