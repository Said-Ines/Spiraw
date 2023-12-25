import 'scanned_qr_model.dart';

class MachineModel {
  final String uid;
  final ScannedQrCodeModel qrCode;
  final String userId;

  MachineModel({
    required this.uid,
    required this.qrCode,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'qrCode': qrCode.toJson(),
      'userId': userId,
    };
  }

  factory MachineModel.fromMap(Map<String, dynamic> map) {
    return MachineModel(
      uid: map['uid'],
      qrCode: ScannedQrCodeModel.fromJson(map['qrCode']),
      userId: 'userId',
    );
  }
}
