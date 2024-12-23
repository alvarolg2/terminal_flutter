import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terminal_flutter/app/app.locator.dart';
import 'package:terminal_flutter/enums/bottom_sheet_type.dart';
import 'package:terminal_flutter/ui/common/app_strings.dart';
import 'package:terminal_flutter/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });

  group('showBottomSheet -', () {
    test('When called, should show custom bottom sheet using notice variant',
        () {
      final bottomSheetService = getAndRegisterBottomSheetService();

      final model = _getModel();
      model.showBottomSheet();
      verify(bottomSheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: ksHomeBottomSheetTitle,
        description: ksHomeBottomSheetDescription,
      ));
    });
  });
}
