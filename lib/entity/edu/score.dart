import 'package:json_annotation/json_annotation.dart';
import 'package:kite/service/edu/util.dart';

import '../edu.dart';

part 'score.g.dart';

@JsonSerializable()
class Score {
  /// 成绩
  @JsonKey(name: 'cj', fromJson: stringToDouble)
  final double value;

  /// 课程
  @JsonKey(name: 'kcmc')
  final String course;

  /// 课程代码
  @JsonKey(name: 'kch')
  final String courseId;

  /// 班级
  @JsonKey(name: 'jxb_id')
  final String classId;

  /// 学年
  @JsonKey(name: 'xnmmc', fromJson: formFieldToSchoolYear, toJson: schoolYearToFormField)
  final SchoolYear schoolYear;

  /// 学期
  @JsonKey(name: 'xqm', fromJson: formFieldToSemester)
  final Semester semester;

  /// 学分
  @JsonKey(name: 'xf', fromJson: stringToDouble)
  final double credit = 0.0;

  const Score(this.value, this.course, this.courseId, this.classId, this.schoolYear, this.semester);

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
}

class ScoreDetail {
  /// 成绩名称
  final String scoreType;

  /// 占总成绩百分比
  final String percentage;

  /// 成绩数值
  final double value;

  const ScoreDetail(
    this.scoreType,
    this.percentage,
    this.value,
  );
}
