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
import 'dart:convert';

import 'package:kite/domain/edu/dao/index.dart';
import 'package:kite/domain/edu/entity/index.dart';

const _timetableJson = '''
[{"cd_id":"835","cdmc":"二教F301","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-2节","jcor":"1-8","jcs":"1-2","jgh_id":"0716","jgpxzd":"1","jxb_id":"C1E6D59249DA5BCAE055E2219BB20201","jxbmc":"2100909","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B2042322","kch_id":"B2042322","kclb":"其他","kcmc":"编译原理","kcxszc":"理论:32","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"3","oldzc":"255","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"3","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2","xkbz":"无","xm":"林X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-8周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"85"},{"cd_id":"925","cdmc":"奉贤实践基地","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-8节","jcor":"1-8","jcs":"1-8","jgh_id":"2945","jgpxzd":"1","jxb_id":"C102FAFE7A9FEADEE055E2219BB20201","jxbmc":"2000413","jxbsftkbj":"0","jxbzc":"19104221","kch":"B7042653","kch_id":"B7042653","kclb":"其他","kcmc":"Java企业级项目实训","kcxszc":"实践:96","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"255","oldzc":"458752","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"8","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"张XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"04","year":"2022","zcd":"17-19周","zcmc":"讲师","zfjmc":"主讲","zhxs":"32","zxs":"96","zxxx":"无","zyfxmc":"无方向","zzrl":"38"},{"cd_id":"849","cdmc":"二教F406","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-8","jcs":"3-4","jgh_id":"2324","jgpxzd":"1","jxb_id":"C1E714E231B15C95E055E2219BB20201","jxbmc":"2100921","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B3042289","kch_id":"B3042289","kclb":"其他","kcmc":"软件需求分析与建模","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"4095","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"5","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"薛X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-12周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"846","cdmc":"二教F407","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"5-6节","jcor":"1-8","jcs":"5-6","jgh_id":"2324","jgpxzd":"1","jxb_id":"C1E72D37A1995DA9E055E2219BB20201","jxbmc":"2100915","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B3042277","kch_id":"B3042277","kclb":"其他","kcmc":"Java框架与组件技术","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"48","oldzc":"51","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"4","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"薛X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-2周,5-6周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"B3E0FDA13EFC195EE055E2219BB20201","cdmc":"七科A518","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"5-6节","jcor":"1-8","jcs":"5-6","jgh_id":"2324","jgpxzd":"1","jxb_id":"C2BD307FE5AE9D49E055E2219BB20201","jxbmc":"2100915A","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B3042277","kch_id":"B3042277","kclb":"其他","kcmc":"Java框架与组件技术","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"未安排","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"48","oldzc":"4044","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"4","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"薛X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"02","year":"2022","zcd":"3-4周,7-12周","zcmc":"讲师","zfjmc":"主讲","zhxs":"2","zxs":"16","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"868","cdmc":"二教H204","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"7-8节","jcor":"1-8","jcs":"7-8","jgh_id":"2558","jgpxzd":"1","jxb_id":"C1E79775A01C5F2FE055E2219BB20201","jxbmc":"2100935","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045037","kch_id":"B4045037","kclb":"其他","kcmc":"软件工程","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"192","oldzc":"15","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"6","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"张X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-4周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"B3E0FDA13EFC195EE055E2219BB20201","cdmc":"七科A518","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"7-8节","jcor":"1-8","jcs":"7-8","jgh_id":"2558","jgpxzd":"1","jxb_id":"C2BE71903D85A287E055E2219BB20201","jxbmc":"2100935A","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045037","kch_id":"B4045037","kclb":"其他","kcmc":"软件工程","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"未安排","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"192","oldzc":"4080","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"6","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"张X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"1","xqjmc":"星期一","xqm":"3","xqmc":"奉贤校区","xsdm":"02","year":"2022","zcd":"5-12周","zcmc":"讲师","zfjmc":"主讲","zhxs":"2","zxs":"16","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"925","cdmc":"奉贤实践基地","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-8节","jcor":"1-8","jcs":"1-8","jgh_id":"2945","jgpxzd":"1","jxb_id":"C102FAFE7A9FEADEE055E2219BB20201","jxbmc":"2000413","jxbsftkbj":"0","jxbzc":"19104221","kch":"B7042653","kch_id":"B7042653","kclb":"其他","kcmc":"Java企业级项目实训","kcxszc":"实践:96","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"255","oldzc":"458752","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"8","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"张XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"04","year":"2022","zcd":"17-19周","zcmc":"讲师","zfjmc":"主讲","zhxs":"32","zxs":"96","zxxx":"无","zyfxmc":"无方向","zzrl":"38"},{"cd_id":"794","cdmc":"二教G103","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-8","jcs":"3-4","jgh_id":"BC1DD168ED54C2E0E055E2219BB20201","jgpxzd":"1","jxb_id":"C2086E4E212FDDE6E055E2219BB20201","jxbmc":"2101719","jxbsftkbj":"1","jxbzc":"19104221;19104222;19104341","kch":"B1280007","kch_id":"B1280007","kclb":"公共基础课","kcmc":"毛泽东思想和中国特色社会主义理论体系概论(下)","kcxszc":"理论:40,实验:8","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"16469","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"1","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3.0","xkbz":"无","xm":"袁XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-7周(单),15周","zfjmc":"主讲","zhxs":"3","zxs":"40","zxxx":"无","zyfxmc":"无方向","zzrl":"174"},{"cd_id":"925","cdmc":"奉贤实践基地","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-8","jcs":"3-4","jgh_id":"BC1DD168ED54C2E0E055E2219BB20201","jgpxzd":"1","jxb_id":"C2086E4E212FDDE6E055E2219BB20201","jxbmc":"2101719","jxbsftkbj":"1","jxbzc":"19104221;19104222;19104341","kch":"B1280007","kch_id":"B1280007","kclb":"公共基础课","kcmc":"毛泽东思想和中国特色社会主义理论体系概论(下)","kcxszc":"理论:40,实验:8","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"5376","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"1","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3.0","xkbz":"无","xm":"袁XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"9-13周(单)","zfjmc":"主讲","zhxs":"3","zxs":"40","zxxx":"无","zyfxmc":"无方向","zzrl":"174"},{"cd_id":"894","cdmc":"二教F206","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"5-6节","jcor":"1-8","jcs":"5-6","jgh_id":"1093","jgpxzd":"1","jxb_id":"C1E79775A01F5F2FE055E2219BB20201","jxbmc":"2100936","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045045","kch_id":"B4045045","kclb":"其他","kcmc":"软件项目管理与案例分析","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"48","oldzc":"7","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"7","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"王XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-3周","zcmc":"副教授","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"84"},{"cd_id":"B3E0FDA13EFC195EE055E2219BB20201","cdmc":"七科A518","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"5-6节","jcor":"1-8","jcs":"5-6","jgh_id":"1093","jgpxzd":"1","jxb_id":"C2B8F5897D3F8CBFE055E2219BB20201","jxbmc":"2100936A","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045045","kch_id":"B4045045","kclb":"其他","kcmc":"软件项目管理与案例分析","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"未安排","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"48","oldzc":"2024","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"7","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"王XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"02","year":"2022","zcd":"4-6周(双),7-11周","zcmc":"副教授","zfjmc":"主讲","zhxs":"2","zxs":"16","zxxx":"无","zyfxmc":"无方向","zzrl":"84"},{"cd_id":"935","cdmc":"一教B103","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"5-6节","jcor":"1-8","jcs":"5-6","jgh_id":"1093","jgpxzd":"1","jxb_id":"C1E79775A01F5F2FE055E2219BB20201","jxbmc":"2100936","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045045","kch_id":"B4045045","kclb":"其他","kcmc":"软件项目管理与案例分析","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"48","oldzc":"2064","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"7","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"王XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"5周,12周","zcmc":"副教授","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"84"},{"cd_id":"871","cdmc":"二教H307","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"7-8节","jcor":"1-8","jcs":"7-8","jgh_id":"3329","jgpxzd":"1","jxb_id":"C1C83E3CD12BE503E055E2219BB20201","jxbmc":"2000587","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B204212","kch_id":"B204212","kclb":"其他","kcmc":"计算机网络原理","kcxszc":"理论:40,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"192","oldzc":"16383","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"2","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"马XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"2","xqjmc":"星期二","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-14周","zcmc":"副教授","zfjmc":"主讲","zhxs":"4","zxs":"40","zxxx":"无","zyfxmc":"无方向","zzrl":"86"},{"cd_id":"925","cdmc":"奉贤实践基地","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-6节","jcor":"1-6","jcs":"1-6","jgh_id":"2945","jgpxzd":"1","jxb_id":"C102FAFE7A9FEADEE055E2219BB20201","jxbmc":"2000413","jxbsftkbj":"0","jxbzc":"19104221","kch":"B7042653","kch_id":"B7042653","kclb":"其他","kcmc":"Java企业级项目实训","kcxszc":"实践:96","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"63","oldzc":"458752","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"8","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"张XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"3","xqjmc":"星期三","xqm":"3","xqmc":"奉贤校区","xsdm":"04","year":"2022","zcd":"17-19周","zcmc":"讲师","zfjmc":"主讲","zhxs":"32","zxs":"96","zxxx":"无","zyfxmc":"无方向","zzrl":"38"},{"cd_id":"893","cdmc":"二教F204","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-6","jcs":"3-4","jgh_id":"2558","jgpxzd":"1","jxb_id":"C1E79775A01C5F2FE055E2219BB20201","jxbmc":"2100935","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045037","kch_id":"B4045037","kclb":"其他","kcmc":"软件工程","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"3","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"6","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"张X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"3","xqjmc":"星期三","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-2周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"876","cdmc":"二教H304","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-6","jcs":"3-4","jgh_id":"2558","jgpxzd":"1","jxb_id":"C1E79775A01C5F2FE055E2219BB20201","jxbmc":"2100935","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045037","kch_id":"B4045037","kclb":"其他","kcmc":"软件工程","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"4","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"6","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"张X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"3","xqjmc":"星期三","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"3周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"872","cdmc":"二教H309","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-6","jcs":"3-4","jgh_id":"2558","jgpxzd":"1","jxb_id":"C1E79775A01C5F2FE055E2219BB20201","jxbmc":"2100935","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045037","kch_id":"B4045037","kclb":"其他","kcmc":"软件工程","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"8","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"6","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"张X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"3","xqjmc":"星期三","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"4周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"840","cdmc":"二教F304","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-6","jcs":"3-4","jgh_id":"2558","jgpxzd":"1","jxb_id":"C1E79775A01C5F2FE055E2219BB20201","jxbmc":"2100935","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045037","kch_id":"B4045037","kclb":"其他","kcmc":"软件工程","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"4080","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"6","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"张X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"3","xqjmc":"星期三","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"5-12周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"846","cdmc":"二教F407","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-2节","jcor":"1-6","jcs":"1-2","jgh_id":"2324","jgpxzd":"1","jxb_id":"C1E72D37A1995DA9E055E2219BB20201","jxbmc":"2100915","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B3042277","kch_id":"B3042277","kclb":"其他","kcmc":"Java框架与组件技术","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"3","oldzc":"4095","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"4","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"薛X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-12周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"925","cdmc":"奉贤实践基地","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-6节","jcor":"1-6","jcs":"1-6","jgh_id":"2945","jgpxzd":"1","jxb_id":"C102FAFE7A9FEADEE055E2219BB20201","jxbmc":"2000413","jxbsftkbj":"0","jxbzc":"19104221","kch":"B7042653","kch_id":"B7042653","kclb":"其他","kcmc":"Java企业级项目实训","kcxszc":"实践:96","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"63","oldzc":"458752","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"8","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"张XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"04","year":"2022","zcd":"17-19周","zcmc":"讲师","zfjmc":"主讲","zhxs":"32","zxs":"96","zxxx":"无","zyfxmc":"无方向","zzrl":"38"},{"cd_id":"794","cdmc":"二教G103","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-6","jcs":"3-4","jgh_id":"BC1DD168ED54C2E0E055E2219BB20201","jgpxzd":"1","jxb_id":"C2086E4E212FDDE6E055E2219BB20201","jxbmc":"2101719","jxbsftkbj":"1","jxbzc":"19104221;19104222;19104341","kch":"B1280007","kch_id":"B1280007","kclb":"公共基础课","kcmc":"毛泽东思想和中国特色社会主义理论体系概论(下)","kcxszc":"理论:40,实验:8","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"32767","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"1","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3.0","xkbz":"无","xm":"袁XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-15周","zfjmc":"主讲","zhxs":"3","zxs":"40","zxxx":"无","zyfxmc":"无方向","zzrl":"174"},{"cd_id":"968","cdmc":"一教C203","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-6","jcs":"3-4","jgh_id":"BC1DD168ED54C2E0E055E2219BB20201","jgpxzd":"1","jxb_id":"C2086E4E212FDDE6E055E2219BB20201","jxbmc":"2101719","jxbsftkbj":"1","jxbzc":"19104221;19104222;19104341","kch":"B1280007","kch_id":"B1280007","kclb":"公共基础课","kcmc":"毛泽东思想和中国特色社会主义理论体系概论(下)","kcxszc":"理论:40,实验:8","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"32768","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"1","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3.0","xkbz":"无","xm":"袁XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"16周","zfjmc":"主讲","zhxs":"3","zxs":"40","zxxx":"无","zyfxmc":"无方向","zzrl":"174"},{"cd_id":"835","cdmc":"二教F301","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"5-6节","jcor":"1-6","jcs":"5-6","jgh_id":"0716","jgpxzd":"1","jxb_id":"C1E6D59249DA5BCAE055E2219BB20201","jxbmc":"2100909","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B2042322","kch_id":"B2042322","kclb":"其他","kcmc":"编译原理","kcxszc":"理论:32","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"48","oldzc":"255","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"3","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2","xkbz":"无","xm":"林X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-8周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"85"},{"cd_id":"841","cdmc":"二教F306","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"7-8节","jcor":"7-8","jcs":"7-8","jgh_id":"2324","jgpxzd":"1","jxb_id":"C1E714E231B15C95E055E2219BB20201","jxbmc":"2100921","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B3042289","kch_id":"B3042289","kclb":"其他","kcmc":"软件需求分析与建模","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"192","oldzc":"51","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"5","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"薛X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-2周,5-6周","zcmc":"讲师","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"B3E0FDA13EFA195EE055E2219BB20201","cdmc":"七科A511","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"7-8节","jcor":"7-8","jcs":"7-8","jgh_id":"2324","jgpxzd":"1","jxb_id":"C2BD7D8DD7AD9EA2E055E2219BB20201","jxbmc":"2100921A","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B3042289","kch_id":"B3042289","kclb":"其他","kcmc":"软件需求分析与建模","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"未安排","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"192","oldzc":"4044","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"5","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"薛X","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"4","xqjmc":"星期四","xqm":"3","xqmc":"奉贤校区","xsdm":"02","year":"2022","zcd":"3-4周,7-12周","zcmc":"讲师","zfjmc":"主讲","zhxs":"2","zxs":"16","zxxx":"无","zyfxmc":"无方向","zzrl":"76"},{"cd_id":"863","cdmc":"二教H207","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-2节","jcor":"1-4","jcs":"1-2","jgh_id":"1093","jgpxzd":"1","jxb_id":"C1E79775A01F5F2FE055E2219BB20201","jxbmc":"2100936","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045045","kch_id":"B4045045","kclb":"其他","kcmc":"软件项目管理与案例分析","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"3","oldzc":"3","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"7","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"王XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"5","xqjmc":"星期五","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-2周","zcmc":"副教授","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"84"},{"cd_id":"934","cdmc":"一教B101","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-2节","jcor":"1-4","jcs":"1-2","jgh_id":"1093","jgpxzd":"1","jxb_id":"C1E79775A01F5F2FE055E2219BB20201","jxbmc":"2100936","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045045","kch_id":"B4045045","kclb":"其他","kcmc":"软件项目管理与案例分析","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"3","oldzc":"4076","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"7","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"王XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"5","xqjmc":"星期五","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"3-4周,6-12周","zcmc":"副教授","zfjmc":"主讲","zhxs":"4","zxs":"32","zxxx":"无","zyfxmc":"无方向","zzrl":"84"},{"cd_id":"B3E0FDA13EFC195EE055E2219BB20201","cdmc":"七科A518","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-2节","jcor":"1-4","jcs":"1-2","jgh_id":"1093","jgpxzd":"1","jxb_id":"C2B8F5897D3F8CBFE055E2219BB20201","jxbmc":"2100936A","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B4045045","kch_id":"B4045045","kclb":"其他","kcmc":"软件项目管理与案例分析","kcxszc":"理论:32,实验:16","kcxz":"选修课","khfsmc":"未安排","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"3","oldzc":"16","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"7","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"2.5","xkbz":"无","xm":"王XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"5","xqjmc":"星期五","xqm":"3","xqmc":"奉贤校区","xsdm":"02","year":"2022","zcd":"5周","zcmc":"副教授","zfjmc":"主讲","zhxs":"2","zxs":"16","zxxx":"无","zyfxmc":"无方向","zzrl":"84"},{"cd_id":"925","cdmc":"奉贤实践基地","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"1-4节","jcor":"1-4","jcs":"1-4","jgh_id":"2945","jgpxzd":"1","jxb_id":"C102FAFE7A9FEADEE055E2219BB20201","jxbmc":"2000413","jxbsftkbj":"0","jxbzc":"19104221","kch":"B7042653","kch_id":"B7042653","kclb":"其他","kcmc":"Java企业级项目实训","kcxszc":"实践:96","kcxz":"选修课","khfsmc":"考查","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"15","oldzc":"458752","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"8","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"张XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"5","xqjmc":"星期五","xqm":"3","xqmc":"奉贤校区","xsdm":"04","year":"2022","zcd":"17-19周","zcmc":"讲师","zfjmc":"主讲","zhxs":"32","zxs":"96","zxxx":"无","zyfxmc":"无方向","zzrl":"38"},{"cd_id":"838","cdmc":"二教F307","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-4","jcs":"3-4","jgh_id":"3329","jgpxzd":"1","jxb_id":"C1C83E3CD12BE503E055E2219BB20201","jxbmc":"2000587","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B204212","kch_id":"B204212","kclb":"其他","kcmc":"计算机网络原理","kcxszc":"理论:40,实验:16","kcxz":"选修课","khfsmc":"考试","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"8223","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"2","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"马XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"5","xqjmc":"星期五","xqm":"3","xqmc":"奉贤校区","xsdm":"01","year":"2022","zcd":"1-5周,14周","zcmc":"副教授","zfjmc":"主讲","zhxs":"4","zxs":"40","zxxx":"无","zyfxmc":"无方向","zzrl":"86"},{"cd_id":"B3E0FDA13EFB195EE055E2219BB20201","cdmc":"七科A512","cxbj":"0","date":"二○二二年一月二十一日","dateDigit":"2022年1月21日","dateDigitSeparator":"2022-1-21","day":"21","jc":"3-4节","jcor":"1-4","jcs":"3-4","jgh_id":"3329","jgpxzd":"1","jxb_id":"C2A92A11DA7C502AE055E2219BB20201","jxbmc":"2000587A","jxbsftkbj":"0","jxbzc":"19104221;19104222","kch":"B204212","kch_id":"B204212","kclb":"其他","kcmc":"计算机网络原理","kcxszc":"理论:40,实验:16","kcxz":"选修课","khfsmc":"未安排","kkzt":"1","listnav":"false","localeKey":"zh_CN","month":"1","oldjc":"12","oldzc":"8160","pageable":true,"pkbj":"1","queryModel":{"currentPage":1,"currentResult":0,"entityOrField":false,"limit":15,"offset":0,"pageNo":0,"pageSize":15,"showCount":10,"sorts":[],"totalCount":0,"totalPage":0,"totalResult":0},"rangeable":true,"rk":"2","rsdzjs":0,"skfsmc":"面授讲课","sxbj":"1","totalResult":"0","userModel":{"monitor":false,"roleCount":0,"roleKeys":"","roleValues":"","status":0,"usable":false},"xf":"3","xkbz":"无","xm":"马XX","xnm":"2021","xqdm":"0","xqh1":"02,","xqh_id":"02","xqj":"5","xqjmc":"星期五","xqm":"3","xqmc":"奉贤校区","xsdm":"02","year":"2022","zcd":"6-13周","zcmc":"副教授","zfjmc":"主讲","zhxs":"2","zxs":"16","zxxx":"无","zyfxmc":"无方向","zzrl":"86"}]
''';

class TimetableMock implements TimetableDao {
  @override
  Future<List<Course>> getTimetable(SchoolYear schoolYear, Semester semester) async {
    // 模拟网络延时
    await Future.delayed(const Duration(seconds: 1));
    return (jsonDecode(_timetableJson) as List<dynamic>).map((e) => Course.fromJson(e)).toList();
  }
}
