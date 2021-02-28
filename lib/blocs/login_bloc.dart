
import 'dart:async';

import 'package:psu/resources/firestore_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  // final _firestoreProvider = FirestoreProvider();
  // final PublishSubject<int> _phone = PublishSubject<int>();
  // final _isSignedIn = PublishSubject<bool>();

  // get phone => _phone.stream;
  int _counter = 0;

  PublishSubject<int> _increamentController = PublishSubject<int>();
  PublishSubject _actionController = PublishSubject();
  
  get _inCounter => _increamentController.sink;
  Stream<int> get outCounter => _increamentController.stream;

  get increametAction => _actionController.sink;


  LoginBloc(){
    _actionController.stream.listen(_handleData);
      }
    
    
      void _handleData(event) {
        _counter = _counter + 1;
        _inCounter.add(_counter);

  }
  void dispose(){
    _actionController.close();
    _increamentController.close();
  }
}