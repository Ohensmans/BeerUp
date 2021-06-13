class TypeService {
  String typServId;
  String typSerLibelle;

  TypeService.fromJson(Map<String, dynamic> json)
      : typServId = json['typServId'],
        typSerLibelle = json['typSerLibelle'];
}
