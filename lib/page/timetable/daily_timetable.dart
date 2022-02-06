/*
 *    上应小风筝(SIT-kite)  便利校园，一步到位
 *    Copyright (C) 2022 上海应用技术大学 上应小风筝团队
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
import 'package:flutter/material.dart';
import 'package:kite/entity/edu/index.dart';
import 'package:kite/page/timetable/bottom_sheet.dart';
import 'package:kite/util/edu/icon.dart';

GlobalKey<_DailyTimetableState> dailyTimeTableKey = GlobalKey();

class DailyTimetable extends StatefulWidget {
  List<Course> courseList = <Course>[];
  Map<int, List<List<int>>> dailyCourseList = {};
  List<List<String>> dateTableList = [];
  final ValueChanged<bool> changeFloatingActionButtonShowState;

  DailyTimetable({Key? key, required this.courseList, required this.dailyCourseList, required this.dateTableList, required this.changeFloatingActionButtonShowState})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _DailyTimetableState createState() =>
      _DailyTimetableState(courseList: courseList, dailyCourseList: dailyCourseList, dateTableList: dateTableList, changeFloatingActionButtonShowState: changeFloatingActionButtonShowState);
}

class _DailyTimetableState extends State<DailyTimetable> {
  _DailyTimetableState({required this.courseList, required this.dailyCourseList, required this.dateTableList, required this.changeFloatingActionButtonShowState});

  PageController _pageController = PageController(initialPage: 0, viewportFraction: 1.0);
  final ValueChanged<bool> changeFloatingActionButtonShowState;

  DateTime currTime = DateTime(2021, 12, 25);
  DateTime startTime = DateTime(2021, 9, 6);

  static const String courseIconPath = 'assets/course/';
  bool firstOpen = true;
  late Size _deviceSize;

  bool isShowReturnCurrDayButton = false;

  // index1 -- 周数  index2 -- 天数
  Map<int, List<List<int>>> dailyCourseList = {};
  List<Course> courseList = <Course>[];
  List<Course> currDayCourseList = <Course>[];
  final List<int> tapped = [0, 0];
  int currTimeIndex = 0;
  bool isInitialized = false;

  // 周次 日期x7 月份
  List<List<String>> dateTableList = [];
  final List<String> num2word = [
    "一",
    "二",
    "三",
    "四",
    "五",
    "六",
    "日",
  ];
  Map<int?, String> timeIndex2Time = {
    6: "8:20-9:55",
    24: "10:15-11:50",
    96: "13:00-14:35",
    384: "14:55-16:30",
    30: "8:20-11:50",
    126: "8:20-11:50 13:00-14:35",
    510: "8:20-11:50 13:00-16:30",
    504: "10:15-11:50 13:00-16:30",
    480: "13:00-16:30",
    1536: "18:00-19:35",
    3584: "18:00-20:25",
    4064: "13:00-20:25",
    null: "XXX"
  };

  @override
  void initState() {
    super.initState();
    int days = currTime.difference(startTime).inDays;
    currTimeIndex = (days-6)~/7+1;
    // print(-2~/7);
    //监听滚动事件，打印滚动位置
    _pageController.addListener(() {
        // 相差时间超过一周 就需要跳转
        print(_pageController.page)                        ;
        if (days > 5){
          currTimeIndex = (days-6)~/7+1;
          if (_pageController.page!.toInt() != currTimeIndex){
            // 显示跳转按钮
            changeFloatingActionButtonShowState(true);
          }
        }
    });
  }

  void gotoCurrPage(){
    print(currTimeIndex);
    // _pageController.animateToPage(currTimeIndex,
    //     duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    _pageController.jumpToPage(currTimeIndex);
    setState(() {
      tapped[0] = currTimeIndex;
      tapped[1] = 0;
      currDayCourseList = _getCourseListByWeekAndDay(tapped[0], tapped[1]);
    });
    // changeFloatingActionButtonShowState(false);
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _pageController.dispose();
    super.dispose();
  }

  List<Course> _getCourseListByWeekAndDay(int weekIndex, int dayIndex) {
    print("this is getCourseListByWeekAndDay");
    List<Course> res = <Course>[];
    for (var i in dailyCourseList[weekIndex]![dayIndex]) {
      res.add(courseList[i]);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    if (firstOpen) {
      currDayCourseList = _getCourseListByWeekAndDay(0, 0);
      firstOpen = false;
    }
    _deviceSize = MediaQuery.of(context).size;
    print("currDayCourseList");
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      // index 从0开始
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: _buildDateTable(index),
                )),
            Expanded(
              flex: 10,
              child: ListView(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  children: currDayCourseList == []
                      ? [
                          const Center(
                            child: Text("今天没有课哦"),
                          )
                        ]
                      : currDayCourseList.map((e) => _buildClassCard(context, e)).toList()),
            )
          ],
        );
      },
    );
  }

  Widget _buildDateTable(int weekIndex) {
    List<String> currWeek = dateTableList[weekIndex];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return index == 0
              ? SizedBox(
                  width: _deviceSize.width * 2 / 23,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (weekIndex + 1).toString(),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        "周",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ))
              : Container(
                  width: _deviceSize.width * 3 / 23,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tapped[0] = weekIndex;
                            tapped[1] = index - 1;
                            print("tapped on:"+tapped.toString());
                            currDayCourseList = _getCourseListByWeekAndDay(weekIndex, index - 1);
                          });
                        },
                        onTapDown: (TapDownDetails tapDownDetails) {},
                        child: Container(
                            decoration: BoxDecoration(
                              color: ((tapped[0] == weekIndex) && (tapped[1] == index - 1))
                                  ? const Color.fromARGB(255, 228, 235, 245)
                                  : Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "周" + num2word[index - 1],
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  currWeek[index - 1],
                                  style: const TextStyle(fontSize: 11),
                                ),
                              ],
                            )),
                      )),
                );
        });
  }

  Widget _buildClassCard(BuildContext context, Course course) {
    // 测试数据
    List<String> detail = [course.place.toString()];
    return InkWell(
      onTap: () {},
      onTapDown: (TapDownDetails tapDownDetails) {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return CourseBottomSheet(_deviceSize, course.courseName.toString(), course.courseId.toString(),
                  course.dynClassId.toString(), detail);
            },
            context: context);
      },
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(4)),
          Card(
            child: Column(
              children: [
                ListTile(
                    leading: Image.asset(courseIconPath + CourseCategory.query(course.courseName ?? '') + '.png'),
                    title: Text(course.courseName.toString()),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text(course.teacher.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                textDirection: TextDirection.ltr,
                                // TODO: 解析timeIndex
                                children: [
                                  Text(timeIndex2Time[course.timeIndex]!),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                course.place.toString(),
                                textAlign: TextAlign.right,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            shape: const RoundedRectangleBorder(
              // ignore: prefer_const_constructors
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            clipBehavior: Clip.antiAlias,
            color: const Color.fromARGB(255, 228, 235, 245),
          )
        ],
      ),
    );
  }
}
