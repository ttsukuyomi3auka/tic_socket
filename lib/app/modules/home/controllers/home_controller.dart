import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tic_socket/services/socket_service.dart';

class HomeController extends GetxController {
  TextEditingController playerName = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void addUser() {
    SocketService.to.addUser(playerName.text);
  }
}
