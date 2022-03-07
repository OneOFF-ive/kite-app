import 'package:kite/domain/edu/entity/index.dart';
import 'package:kite/domain/edu/service/index.dart';

import '../mock_util.dart';

void main() async {
  await init();
  await login();
  final eduSession = SessionPool.eduSession;
  test('exam test', () async {
    var table = await ExamService(eduSession).getExamList(
      const SchoolYear(2021),
      Semester.firstTerm,
    );
    // Log.info(table);
    print(table);
  });
}
