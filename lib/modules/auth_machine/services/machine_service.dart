import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../app/constants/firebase_collections.dart';
import '../../../helpers/debugging_printer.dart';
import '../data/machine_model.dart';

class MachineService {
  final CollectionReference machineCollection = FirebaseFirestore.instance.collection(FirebaseCollections.machines);

  Future<void> saveMachinetoDatabase(MachineModel machine) async {
    try {
      await machineCollection.doc(machine.uid).set(machine.toMap());
    } on FirebaseException catch (e) {
      Debugger.red("Error while saving user info: $e");
    }
  }
}
