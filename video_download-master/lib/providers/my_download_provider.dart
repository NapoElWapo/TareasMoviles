import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class MyDownloadProvider with ChangeNotifier {
  bool isPermissionGranted = false;
  bool? isSavedSuccess;
  bool isLoading = false;
  String videoName = "butterfly";
  String? videoPath;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  Future<void> descargarVideo() async {
    // TODO 1: descargar video
    try {
      var response = await http.get(Uri.parse(videoUrl));
      if(response.statusCode == 200){
        await _saveFile(response.bodyBytes);
        print("descargado");
      }
      else{
        print("error");
      }
    } catch (e) {
      print(e);
    }
     }
  Future<bool> _requestStoragePermission() async {
    await Permission.storage.request();
    isPermissionGranted = await Permission.storage.isGranted;

    return true;
  }

  Future<void> _saveFile(Uint8List _content) async {
    if(!await _requestStoragePermission()){
      isLoading = false;
      isPermissionGranted = false;
      notifyListeners();
      return;
    }

    Directory? dir;
    if(Platform.isAndroid){
      dir = await getExternalStorageDirectory();
    }
    else if(Platform.isIOS){
      dir = await getApplicationDocumentsDirectory();
    }
    else{
      dir = await getApplicationSupportDirectory();
    }

    videoPath = "${dir!.path}/$videoName.mp4";
    File file = File(videoPath!);
    await file.writeAsBytes(_content);
    isSavedSuccess = await file.exists();
    isLoading = false;
    notifyListeners();


  }
}
