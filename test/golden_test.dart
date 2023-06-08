import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Golden test', (WidgetTester tester) async {
    await loadAppFonts();

    var myApp = const MyWidget(title: 'Titel', message: 'Message fheiwuofheoiufh esoihfj eisofj seiofjie s');
    await tester.pumpWidget(myApp);

    await multiScreenGolden(
      tester,
      "main_page",
      devices: [
        Device.iphone11,
        Device.phone.copyWith(name: "androidSmallPhone"),

      ],
    );
  });
}
