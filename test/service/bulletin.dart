import 'package:flutter_test/flutter_test.dart';
import 'package:kite/global/session_pool.dart';
import 'package:kite/global/storage_pool.dart';
import 'package:kite/service/bulletin.dart';
import 'package:kite/util/logger.dart';

void main() async {
  await StoragePool.init();
  await SessionPool.init();
  final session = SessionPool.ssoSession;
  await session.login('', '');

  test('test bulletin', () async {
    final dao = BulletinService(session);
    final list = await dao.getAllCatalogues();
    Log.info(list);
    final bulletin = await dao.getBulletinDetail('pe2362', '7d227947-6dfc-11ec-9e2f-abfe89c3f6e3');
    Log.info(bulletin);
  });
}