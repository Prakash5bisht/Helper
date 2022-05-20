
import 'package:get/get.dart';
import 'package:helper/model/EditUserDataInDatabase.dart';
import 'package:helper/model/GetUserDataFromLocalDatabase.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditingController extends GetxController{


  GetUserDataFromLocalDatabase _userDataFromLocalDatabase;
  EditUserDataInDatabase _editUserDataInDatabase;

  var _name;
  var _alertText;
  var _myImage;

  ProfileEditingController(){
    _userDataFromLocalDatabase = GetUserDataFromLocalDatabase();
    _editUserDataInDatabase = EditUserDataInDatabase();
    _name = _userDataFromLocalDatabase.getUserName().obs;
    _myImage = _userDataFromLocalDatabase.getProfilePhoto().obs;
    _alertText = ''.obs;
  }




  String getProfilePhoto(){
    return _myImage.value;
  }

  String getName(){
    return _name.value;
  }

  void setName(String newName){
    _name.value = newName;
    _editUserDataInDatabase.updateUserName(newName);
  }

  void changeProfilePhoto() async{
    final ImagePicker _imagePicker = ImagePicker();
    var  _image =  await _imagePicker.pickImage(source: ImageSource.gallery);
    _myImage.value = _image.path;
    _editUserDataInDatabase.changeProfilePhoto(_image);
  }

  String getAlertText(){
    return _alertText.value;
  }

  void resetAlertText(){
    _alertText = ''.obs;
  }

  void tooShortPassword(){
    _alertText.value = 'Password should be of 4 digits.';
  }

  void emptyField(){
    _alertText.value = 'Empty Field';
  }

}