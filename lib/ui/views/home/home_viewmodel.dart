import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:terminal_flutter/app/app.locator.dart';
import 'package:terminal_flutter/enums/bottom_sheet_type.dart';
import 'package:terminal_flutter/enums/dialog_type.dart';
import 'package:terminal_flutter/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final TextEditingController timeToShutDown = TextEditingController();
  final TextEditingController timeToRestart = TextEditingController();

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void shutDown() {
    Process.run('shutdown -s', [], runInShell: true)
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }

  void restart() {
    Process.run('shutdown -r', [], runInShell: true)
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }

  void schedoleShutDown() {
    int time = int.parse(timeToShutDown.text);
    time = time * 60;
    Process.run('shutdown -s -t $time', [], runInShell: true)
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }

  void schedoleRestart() {
    int time = int.parse(timeToRestart.text);
    time = time * 60;
    Process.run('shutdown -r -t $time', [], runInShell: true)
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }

  void cancelShutDown() {
    Process.run('shutdown -a', [], runInShell: true)
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }
}
