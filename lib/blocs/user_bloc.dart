import 'package:firebase_auth/firebase_auth.dart';
import 'package:psu/constants/auth_state.dart';
import 'package:psu/resources/user_auth.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  
  UserAuth _userAuth = UserAuth();
  String _userId;
  PublishSubject<AuthState> _userStateController = PublishSubject<AuthState>();
  get _getUserState => _userStateController.sink;
  Stream<AuthState> get userState => _userStateController.stream;

  PublishSubject<String> _userPhoneController = PublishSubject<String>();
  get getUserPhone => _userPhoneController.sink;
  Stream<String> get userPhone => _userPhoneController.stream;

  PublishSubject<bool> _verificationController = PublishSubject<bool>();
  get addVerification => _verificationController.sink;
  Stream<bool> get getVerificationStatus => _verificationController.stream;


    bool isCodeSent = false;
  String _verificationId;

   Future<String> signIn() async {
    var userId =  await UserAuth().signIn('bereket@gmail.com', '123456');
     return userId ;
  }
  Future<void> signOut() async {
    await UserAuth().signOut();
  }
  Future<void> verfiyPhone(String phone) async {
    print('bloc print');
    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this._verificationId = verificationId;
 
      print('Code sent to $phone');
      addVerification.add(true);
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;

    };
    final PhoneVerificationFailed verificationFailed = (AuthException exception){
          print('verification failed');
          print(exception.message);

        };

    //print(await UserAuth().signWithPhone(phone));
    await UserAuth().signWithPhone(
      phone,
      codeSent,
      codeAutoRetrievalTimeout,
      verificationFailed,
      
      );
     
  }



  UserBloc(){
    UserAuth().getUser().then((user){
      if (user != null) {
        _userId = user.uid;
        
        _getUserState.add(AuthState.LOGGED_IN);
      }
      else{
        _getUserState.add(AuthState.NOT_LOGGED_IN);
        addVerification.add(false);
        userPhone.listen((onData){
          print(onData);
          verfiyPhone(onData);
        });
      }
    });
  }
   void dispose(){
    _userStateController.close();
    _userPhoneController.close();
    _verificationController.close();
    
  }
  
}