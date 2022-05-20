import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view/phone_view/custom_alert_box.dart';

class PermissionHandler{

  // contact permission


  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  Future<bool> _askContactPermissions(BuildContext context) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      showAlert(context: context, alert: 'NOT ALLOWED', description: 'Please grant permission to access your contacts from phone settings.', defaultButtonName: 'OK');
      return false;
    }
  }

  Future<List<Contact>> myContacts(BuildContext context, String qry) async {
    bool granted = await _askContactPermissions(context);
    List<Contact> contacts;
    if(granted){
      contacts = await ContactsService.getContacts(withThumbnails: false, query: qry);
    }
    return contacts;
  }

  //

  // do not disturb permission

  Future<PermissionStatus> _getDNDPermission() async {
    PermissionStatus permission = await Permission.accessNotificationPolicy.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.accessNotificationPolicy.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  Future<bool> askDNDPermissions(BuildContext context) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      showAlert(context: context, alert: 'NOT ALLOWED', description: 'Do not disturb permissions not enabled for current device!', defaultButtonName: 'OK');
      return false;
    }
  }



}