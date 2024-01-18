class Area{
  int id;
  int suppliyerId;
  String areaname;
  String createdAt;
  String updatedAt;

  Area({
    required this.id,
    required this.suppliyerId,
    required this.areaname,
    required this.createdAt,
    required this.updatedAt
  });

   
  //Convertir les données pour le stockage de la bdd sqlite pour l'affichage
  Map<String, dynamic> toSqfliteDatabase() {
    return {
      'id': id,
      'suppliyerId': suppliyerId,
      'areaname': areaname,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  //Convertir les données pour le stockage dans une bdd sqlite
  factory Area.fromSqfliteDatabase(Map<String, dynamic> data) {
    return Area(
      id: data['id'],
      suppliyerId: data['suppliyerId'],
      areaname: data['areaname'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
  // factory Area.fromJson(Map<String, dynamic> json) => Area(
  //   id: json['id'],
  //   suppliyerId: json['suppliyerId'],
  //   areaname: json['areaname'],
  //   createdAt: json['createdAt'],
  //   updatedAt: json['updatedAt'],
  // );
  // Map<String, dynamic> toJson() => {
  //   "id" : id,
  //   "suppliyerId" : suppliyerId,
  //   "areaname" : areaname,
  //   "createdAt" : createdAt,
  //   "updatedAt" : updatedAt,
  // };
}

