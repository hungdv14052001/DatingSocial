import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future showLoading(BuildContext context) async {
  return showDialog(
    routeSettings: const RouteSettings(name: "showDialog"),
    barrierDismissible: false,
    context: context,
    useRootNavigator: true,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              size: 70,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    ),
  );
}

closeLoading(BuildContext contexta) {
  final context = contexta;
  if (context != null) {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.settings.name != "showDialog");
  }
}



showToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 14.0,
      backgroundColor: Colors.black45);
}

showToastComingSoon(
    {required BuildContext context, ToastGravity? gravity}) async {
  FToast fToast = FToast();
  fToast.init(context);
  fToast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(79, 112, 255, 1),
              ),
              child: const Text("i", style: TextStyle(color: Colors.white))),
          const SizedBox(
            width: 12.0,
          ),
          const Text("Upcoming feature. Coming soon!"),
        ],
      ),
    ),
    gravity: gravity ?? ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

showToastStatus(
    {required BuildContext context,
    ToastGravity? gravity,
    String? status}) async {
  FToast fToast = FToast();
  fToast.init(context);
  fToast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(79, 112, 255, 1),
              ),
              child: const Text("i", style: TextStyle(color: Colors.white))),
          const SizedBox(
            width: 12.0,
          ),
          Text("$status"),
        ],
      ),
    ),
    gravity: gravity ?? ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

extension FormatTime on num? {
  String get secondToMinute {
    final hour = (this ?? 0) ~/ (60 * 60);
    final minute = ((this ?? 0) % (60 * 60)) ~/ 60;
    final second = (this ?? 0) % 60;
    final stringHour = hour == 0 ? "" : "$hour:";
    return '$stringHour${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}';
  }
}

