import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  // enableFlutterDriverExtension();
  group('##### App ######', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('#### verifies the list contains a specific item', () async {
      final buttonStart = find.byValueKey('ButtonStart');

      final timeline = await driver.traceAction(() async {
      await driver.waitFor(buttonStart);
     });

       final summary = new TimelineSummary.summarize(timeline);
       summary.writeTimelineToFile('button##', pretty: true);
      
      //  summary.writeSummaryToFile('scrolling_summary', pretty: true);
    });
  });
}
