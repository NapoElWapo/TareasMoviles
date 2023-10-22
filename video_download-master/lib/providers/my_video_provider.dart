import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;

  void initializeVideoPlayer(String filePath) async {
    // inicializar el video player
    _vCont = await VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false)
      ..initialize().then((value) async {
        // TODO 7: cargar el progreso guardado del video
        await loadConfigs();
      });
  }

  void isPlayOrPause(bool isPlay) {
    if (isPlay) {
      _vCont!.pause();
    } else {
      _vCont!.play();
    }
    notifyListeners();
  }

  // TODO 6: cargar datos
  Future<void> loadConfigs() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File("${directory.path}/video_config.txt");
      final data = await file.readAsLines();
      final position = int.parse(data[0]);
      final isPlaying = data[1] == "true" ? true : false;
      _vCont!.seekTo(Duration(milliseconds: position));
      if (isPlaying) {
        _vCont!.play();
      } else {
        _vCont!.pause();
      }
    } catch (e) {
      print("Error al cargar: ${e.toString()}");
    }
    
  }

  // TODO 10: guardar datos
  Future saveConfigs() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File("${directory.path}/video_config.txt");
      await file.writeAsString(
        "${_vCont!.value.position.inMilliseconds.toString()}\n${_vCont!.value.isPlaying}",
      );
      isSaved = true;
      notifyListeners();
    } catch (e) {
      print("Error al guardar: ${e.toString()}");
      isSaved = false;
      notifyListeners();
    }
  }
}
