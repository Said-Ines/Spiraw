class ScannedQrCodeModel {
  String? id;
  dynamic qrContent;
  int? scannedAt;
  ScannedQrCodeModel({
    this.id,
    this.qrContent,
    this.scannedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qrContent': qrContent,
      'scannedAt': scannedAt,
    };
  }

  ScannedQrCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    qrContent = json['qrContent'];
    scannedAt = json['scannedAt'] as int;
  }
}
