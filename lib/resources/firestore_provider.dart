
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psu/models/park_model.dart';

class FirestoreProvider{
  Firestore _firestore = Firestore.instance;

  Future<bool> createParking(ParkModel park) async{
    _firestore.collection('parking').document().setData({
      'psuId': park.psuId,
      'pspId': park.pspId,
      'startTime': park.startTime,
      'endTime': park.endTime,
      'price': park.price
    }).then((onValue){
      return true;
    });
    return false;
  }
  List<DocumentSnapshot> getPsuHistory(String psuId){
    _firestore.collection('parking').where('psuId', isEqualTo : psuId).getDocuments()
    .then((value){
      return value.documents;
    });
    return null;
  }
  List<DocumentSnapshot> getPspHistory(String pspId){
    _firestore.collection('parking').where('pspId', isEqualTo : pspId).getDocuments()
    .then((value){
      return value.documents;
    });
    return null;
  }
   

}