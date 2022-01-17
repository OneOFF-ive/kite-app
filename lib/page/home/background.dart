import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

class HomeBackground extends StatelessWidget {
  final int _weatherCode;

  const HomeBackground(this._weatherCode, {Key? key}) : super(key: key);

  WeatherType _getWeatherTypeByCode(int code) {
    return weatherCodeToType[code] ?? WeatherType.sunny;
  }

  Widget _buildWeatherBg(Size windowSize) {
    return WeatherBg(
      weatherType: _getWeatherTypeByCode(_weatherCode),
      width: windowSize.width,
      height: windowSize.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    return _buildWeatherBg(windowSize);
  }
}

const weatherCodeToType = {
  100: WeatherType.sunny, // 晴
  101: WeatherType.cloudy, // 多云
  102: WeatherType.sunny, // 少云
  103: WeatherType.sunny, // 晴间多云
  104: WeatherType.overcast, // 阴
  150: WeatherType.sunnyNight, // 晴
  151: WeatherType.cloudy, // 多云
  152: WeatherType.sunnyNight, // 少云
  153: WeatherType.sunnyNight, // 晴间多云
  154: WeatherType.overcast, // 阴
  300: WeatherType.lightRainy, // 阵雨
  301: WeatherType.middleRainy, // 强阵雨
  302: WeatherType.thunder, // 雷阵雨
  303: WeatherType.thunder, // 强雷阵雨
  304: WeatherType.thunder, // 雷阵雨伴有冰雹
  305: WeatherType.lightRainy, // 小雨
  306: WeatherType.middleRainy, // 中雨
  307: WeatherType.heavyRainy, // 大雨
  308: WeatherType.heavyRainy, // 极端降雨
  309: WeatherType.lightRainy, // 毛毛雨/细雨
  310: WeatherType.heavyRainy, // 暴雨
  311: WeatherType.heavyRainy, // 大暴雨
  312: WeatherType.heavyRainy, // 特大暴雨
  313: WeatherType.middleRainy, // 冻雨
  314: WeatherType.middleRainy, // 小到中雨
  315: WeatherType.middleRainy, // 中到大雨
  316: WeatherType.heavyRainy, // 大到暴雨
  317: WeatherType.heavyRainy, // 暴雨到大暴雨
  318: WeatherType.heavyRainy, // 大暴雨到特大暴雨
  350: WeatherType.lightRainy, // 阵雨
  351: WeatherType.heavyRainy, // 强阵雨
  399: WeatherType.lightRainy, // 雨
  400: WeatherType.lightSnow, // 小雪
  401: WeatherType.middleSnow, // 中雪
  402: WeatherType.heavySnow, // 大雪
  403: WeatherType.heavySnow, // 暴雪
  404: WeatherType.middleSnow, // 雨夹雪
  405: WeatherType.middleSnow, // 雨雪天气
  406: WeatherType.middleSnow, // 阵雨夹雪
  407: WeatherType.middleSnow, // 阵雪
  408: WeatherType.middleSnow, // 小到中雪
  409: WeatherType.middleSnow, // 中到大雪
  410: WeatherType.heavySnow, // 大到暴雪
  456: WeatherType.heavySnow, // 阵雨夹雪
  457: WeatherType.heavySnow, // 阵雪
  499: WeatherType.lightSnow, // 雪
  500: WeatherType.foggy, // 薄雾
  501: WeatherType.foggy, // 雾
  502: WeatherType.hazy, // 霾
  503: WeatherType.dusty, // 扬沙
  504: WeatherType.dusty, // 浮尘
  507: WeatherType.dusty, // 沙尘暴
  508: WeatherType.dusty, // 强沙尘暴
  509: WeatherType.foggy, // 浓雾
  510: WeatherType.foggy, // 强浓雾
  511: WeatherType.hazy, // 中度霾
  512: WeatherType.hazy, // 重度霾
  513: WeatherType.hazy, // 严重霾
  514: WeatherType.foggy, // 大雾
  515: WeatherType.foggy, // 特强浓雾
  800: WeatherType.sunnyNight, // 新月
  801: WeatherType.sunnyNight, // 蛾眉月
  802: WeatherType.sunnyNight, // 上弦月
  803: WeatherType.sunnyNight, // 盈凸月
  804: WeatherType.sunnyNight, // 满月
  805: WeatherType.sunnyNight, // 亏凸月
  806: WeatherType.sunnyNight, // 下弦月
  807: WeatherType.sunnyNight, // 残月
  900: WeatherType.sunny, // 热
  901: WeatherType.overcast, // 冷
  999: WeatherType.sunny, // 未知
};