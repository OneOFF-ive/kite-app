/*
 * 上应小风筝  便利校园，一步到位
 * Copyright (C) 2022 上海应用技术大学 上应小风筝团队
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kite/feature/freshman/page/component/card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../dao.dart';
import '../../entity.dart';
import '../../init.dart';
import 'basic_info.dart';
import 'common.dart';

class MateListWidget extends StatefulWidget {
  final List<Mate> mateList;
  final VoidCallback? callBack;

  const MateListWidget(this.mateList, {this.callBack, Key? key}) : super(key: key);

  @override
  State<MateListWidget> createState() => _MateListWidgetState();
}

class _MateListWidgetState extends State<MateListWidget> {
  final RefreshController _refreshController = RefreshController();
  final FreshmanDao freshmanDao = FreshmanInitializer.freshmanDao;

  /// 打开个人详情页
  void loadMoreInfo(Mate mate) {
    final lastSeenText = calcLastSeen(mate.lastSeen);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return BasicInfoPageWidget(
        name: mate.name,
        college: mate.college,
        infoItems: [
          InfoItem(Icons.account_circle, "姓名", mate.name),
          InfoItem(Icons.school, "学院", mate.college),
          InfoItem(Icons.emoji_objects, "专业", mate.major),
          InfoItem(Icons.night_shelter, "宿舍楼", mate.building),
          InfoItem(Icons.bed, "寝室", '${mate.room}室${mate.bed}床'),
          InfoItem(mate.gender == 'M' ? Icons.male : Icons.female, "性别", mate.gender == 'M' ? '男' : '女'),
          if (mate.province != null) InfoItem(Icons.location_city, '省份', mate.province!),
          if (mate.lastSeen != null) InfoItem(Icons.location_city, '上次登录时间', lastSeenText),
          ...buildContactInfoItems(context, mate.contact), // unpack
        ],
      );
    }));
  }

  ///构建基本信息
  Widget buildBasicInfoWidget(Mate mate) {
    final wechat = mate.contact?.wechat;
    final qq = mate.contact?.qq;
    final tel = mate.contact?.tel;
    final wechatRow = buildInfoItemRow(
      iconData: Icons.wechat,
      text: '微信号:  ${wechat != null && wechat != '' ? wechat : '未填写'}',
      context: context,
    );
    final qqRow = buildInfoItemRow(
      iconData: Icons.person,
      text: 'QQ:  ${qq != null && qq != '' ? qq : '未填写'}',
      context: context,
    );
    final telRow = buildInfoItemRow(
      iconData: Icons.phone,
      text: '手机号:  ${tel != null && tel != '' ? tel : '未填写'}',
      context: context,
    );

    return Stack(children: [
      Align(
        alignment: const Alignment(1, -1.4),
        child: SizedBox(
          width: 100,
          height: 100,
          child: buildSexIcon(mate.gender == 'M'),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mate.name,
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          SizedBox(
            height: 4.h,
          ),
          buildInfoItemRow(
            iconData: Icons.school,
            text: "学院:  ${mate.college}",
            context: context,
          ),
          buildInfoItemRow(
            iconData: Icons.emoji_objects,
            text: "专业:  ${mate.major}",
            context: context,
          ),
          buildInfoItemRow(
            iconData: Icons.home,
            text: "寝室:  ${mate.building}${mate.room}室",
            context: context,
          ),
          wechatRow,
          qqRow,
          telRow,
        ],
      ),
    ]);
  }

  /// 性别icon印章
  Widget buildSexIcon(bool isMale) {
    return Icon(
      isMale ? Icons.male : Icons.female,
      size: 50,
      color: Colors.black45,
    );
  }

  Widget buildListView(List<Mate> list) {
    return ListView(
      children: list.map((e) {
        return PersonItemCardWidget(
          basicInfoWidget: buildBasicInfoWidget(e),
          name: e.name,
          isMale: e.gender == 'M',
          lastSeenText: calcLastSeen(e.lastSeen),
          locationText: e.province,
          onLoadMore: () => loadMoreInfo(e),
          height: 235,
        );
      }).toList(),
    );
  }

  Widget buildBody(List<Mate> mateList) {
    return Column(
      children: [
        buildInfoItemRow(
          iconData: Icons.info,
          text: '总计人数(不包含自己): ${mateList.length}',
          context: context,
        ).withTitleBarStyle(context),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: widget.callBack,
              child: buildListView(mateList),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(widget.mateList);
  }
}
