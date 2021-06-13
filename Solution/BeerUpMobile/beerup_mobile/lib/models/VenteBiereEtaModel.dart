class VenteBiereEta {
  String typServId;
  String venteBiereEtaId;
  String etaId;
  String bieId;

  VenteBiereEta.fromJson(Map<String, dynamic> json)
      : typServId = json['typServId'],
        venteBiereEtaId = json['venteBiereEtaId'],
        etaId = json['etaId'],
        bieId = json['bieId'];
}
