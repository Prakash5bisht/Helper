import 'package:firebase_auth/firebase_auth.dart';

class UserCredentials {
  String _countryCode;
  String _phoneNum;
  ConfirmationResult _confirmationResult;

  set setConfirmationResult(ConfirmationResult confirmationResult) {
    _confirmationResult = confirmationResult;
  }

  set setCountryCode(String code) {
    _countryCode = code;
  }

  set setPhoneNum(String num) {
    _phoneNum = num;
  }

  String get countryCode {
    return _countryCode;
  }

  String get phoneNumber {
    return _phoneNum;
  }

  ConfirmationResult get getConfirmationResult {
    return _confirmationResult;
  }
}
