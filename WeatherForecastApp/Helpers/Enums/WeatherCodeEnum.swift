//
//  WeatherCodeEnum.swift
//  WeatherForecastApp
//
//  Created by Empulse on 11/12/23.
//

import Foundation



enum WeatherCode: Int {
    case sunny = 1000
    case partlyCloudy = 1003
    case cloudy = 1006
    case overcast = 1009
    case mist = 1030
    case patchyRainPossible = 1063
    case patchySnowPossible = 1066
    case patchySleetPossible = 1069
    case patchyFreezingDrizzlePossible = 1072
    case thunderyOutbreaksPossible = 1087
    case blowingSnow = 1114
    case blizzard = 1117
    case fog = 1135
    case freezingFog = 1147
    case patchyLightDrizzle = 1150
    case lightDrizzle = 1153
    case freezingDrizzle = 1168
    case heavyFreezingDrizzle = 1171
    case patchyLightRain = 1180
    case lightRain = 1183
    case moderateRainAtTimes = 1186
    case moderateRain = 1189
    case heavyRainAtTimes = 1192
    case heavyRain = 1195
    case lightFreezingRain = 1198
    case moderateOrHeavyFreezingRain = 1201
    case lightSleet = 1204
    case moderateOrHeavySleet = 1207
    case patchyLightSnow = 1210
    case lightSnow = 1213
    case patchyModerateSnow = 1216
    case moderateSnow = 1219
    case patchyHeavySnow = 1222
    case heavySnow = 1225
    case icePellets = 1237
    case lightRainShower = 1240
    case moderateOrHeavyRainShower = 1243
    case torrentialRainShower = 1246
    case lightSleetShowers = 1249
    case moderateOrHeavySleetShowers = 1252
    case lightSnowShowers = 1255
    case moderateOrHeavySnowShowers = 1258
    case lightShowersOfIcePellets = 1261
    case moderateOrHeavyShowersOfIcePellets = 1264
    case patchyLightRainWithThunder = 1273
    case moderateOrHeavyRainWithThunder = 1276
    case patchyLightSnowWithThunder = 1279
    case moderateOrHeavySnowWithThunder = 1282
    
    var dayIconCode: String {
        switch self {
        case .sunny: return "sunny"
        case .partlyCloudy: return "partlyCloudy"
        case .cloudy: return "cloudy"
        case .overcast: return "overcast"
        case .mist: return "mist"
        case .patchyRainPossible: return "patchyRainPossible"
        case .patchySnowPossible: return "patchySnowPossible"
        case .patchySleetPossible: return "patchySleetPossible"
        case .patchyFreezingDrizzlePossible: return "patchyFreezingDrizzlePossible"
        case .thunderyOutbreaksPossible: return "thunderyOutbreaksPossible"
        case .blowingSnow: return "blowingSnow"
        case .blizzard: return "blizzard"
        case .fog: return "fog"
        case .freezingFog: return "freezingFog"
        case .patchyLightDrizzle: return "patchyLightDrizzle"
        case .lightDrizzle: return "lightDrizzle"
        case .freezingDrizzle: return "freezingDrizzle"
        case .heavyFreezingDrizzle: return "heavyFreezingDrizzle"
        case .patchyLightRain: return "patchyLightRain"
        case .lightRain: return "lightRain"
        case .moderateRainAtTimes: return "moderateRainAtTimes"
        case .moderateRain: return "heavyRainAtTimes"
        case .heavyRainAtTimes: return "heavyRain"
        case .heavyRain: return "heavyRain"
        case .lightFreezingRain: return "freezingDrizzle"
        case .moderateOrHeavyFreezingRain: return "patchyRainPossible"
        case .lightSleet: return "blizzard"
        case .moderateOrHeavySleet: return "moderateOrHeavySleet"
        case .patchyLightSnow: return "moderateOrHeavySleet"
        case .lightSnow: return "lightSnow"
        case .patchyModerateSnow: return "moderateSnow"
        case .moderateSnow: return "moderateSnow"
        case .patchyHeavySnow: return "patchyHeavySnow"
        case .heavySnow: return "heavySnow"
        case .icePellets: return "lightSnow"
        case .lightRainShower: return "lightDrizzle"
        case .moderateOrHeavyRainShower: return "heavyRainAtTimes"
        case .torrentialRainShower: return "moderateRainAtTimes"
        case .lightSleetShowers: return "patchyLightDrizzle"
        case .moderateOrHeavySleetShowers: return "heavyRain"
        case .lightSnowShowers: return "lightDrizzle"
        case .moderateOrHeavySnowShowers: return "moderateOrHeavySnowShowers"
        case .lightShowersOfIcePellets: return "lightShowersOfIcePellets"
        case .moderateOrHeavyShowersOfIcePellets: return "moderateOrHeavyShowersOfIcePellets"
        case .patchyLightRainWithThunder: return "patchyLightRainWithThunder"
        case .moderateOrHeavyRainWithThunder: return "moderateOrHeavyRainWithThunder"
        case .patchyLightSnowWithThunder: return "392"
        case .moderateOrHeavySnowWithThunder: return "395"
        }
    }
    
    var nightIconName: String {
        switch self {
        case .sunny: return "clearNight"
        case .partlyCloudy: return "partlyCloudyNight"
        case .cloudy: return "cloudyNight"
        case .overcast: return "overcastNight"
        case .blowingSnow: return "blowingSnow"
        case .blizzard: return "blizzard"
        case .patchyLightDrizzle: return "patchyLightDrizzle"
        case .lightFreezingRain: return "freezingDrizzle"
        case .freezingDrizzle: return "freezingDrizzle"
        case .moderateOrHeavyFreezingRain: return "patchyRainPossibleNight"
        case .patchyRainPossible: return "patchyRainPossibleNight"
        case .lightDrizzle: return "lightDrizzle"
        case .heavyFreezingDrizzle: return "heavyFreezingDrizzleNight"
        case .patchyLightRain: return "patchyLightRainNight"
        case .moderateRainAtTimes: return "moderateRainAtTimesNight"
        case .moderateRain: return "moderateRainAtTimesNight"
        case .patchySnowPossible: return "patchySnowPossible"
        case .patchySleetPossible: return "patchySleetPossible"
        case .patchyFreezingDrizzlePossible: return "patchyFreezingDrizzlePossible"
        case .lightRain: return "lightRainNight"
        case .heavyRainAtTimes: return "heavyRainAtTimesNight"
        case .heavyRain: return "heavyRainAtTimesNight"
        case .lightSleet: return "blizzard"
        case .thunderyOutbreaksPossible: return "thunderyOutbreaksPossibleNight"
        case .patchyLightSnow: return "moderateOrHeavySleet"
        case .icePellets: return "lightSnow"
        case .lightSnow: return "lightSnow"
        case .patchyModerateSnow: return "patchyModerateSnowNight"
        case .moderateSnow: return "moderateSnow"
        case .patchyHeavySnow: return "patchyHeavySnow"
        case .heavySnow: return "heavySnow"
        case .lightRainShower: return "lightDrizzle"
        case .moderateOrHeavyRainShower: return "moderateRainAtTimesNight"
        case .torrentialRainShower: return "moderateRainAtTimes"
        case .lightSnowShowers: return "lightDrizzle"
        case .moderateOrHeavySnowShowers: return "moderateOrHeavySnowShowersNight"
        case .lightSleetShowers: return "patchyLightDrizzle"
        case .moderateOrHeavySleetShowers: return "heavyRainAtTimesNight"
        case .patchyLightRainWithThunder: return "patchyLightRainWithThunder"
        case .lightShowersOfIcePellets: return "lightShowersOfIcePelletsNight"
        case .moderateOrHeavyRainWithThunder: return "thunderyOutbreaksPossibleNight"
        case .moderateOrHeavySleet: return "moderateOrHeavySleet"
        case .moderateOrHeavyShowersOfIcePellets: return "moderateOrHeavyShowersOfIcePelletsNight"
        case .fog: return "fog"
        case .freezingFog: return "freezingFog"
        case .mist: return "mist"
        case .patchyLightSnowWithThunder: return "392"
        case .moderateOrHeavySnowWithThunder: return "395"
        }
    }
}



func iconImage(for weatherType: WeatherCode, isDay: Int) -> String? {
    let Day = !(isDay == 0) ? true : false
    let imageName: String
    
    switch weatherType {
    case .sunny: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .partlyCloudy: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .cloudy: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .overcast: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .mist: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyRainPossible: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchySnowPossible: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchySleetPossible: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyFreezingDrizzlePossible: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .thunderyOutbreaksPossible: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .blowingSnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .blizzard: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .fog: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .freezingFog: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyLightDrizzle: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightDrizzle: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .freezingDrizzle: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .heavyFreezingDrizzle: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyLightRain: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightRain: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateRainAtTimes: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateRain: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .heavyRainAtTimes: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .heavyRain: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightFreezingRain: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavyFreezingRain: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightSleet: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavySleet: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyLightSnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightSnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyModerateSnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateSnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyHeavySnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .heavySnow: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .icePellets: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightRainShower: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavyRainShower: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .torrentialRainShower: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightSleetShowers: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavySleetShowers: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightSnowShowers: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavySnowShowers: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .lightShowersOfIcePellets: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavyShowersOfIcePellets: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyLightRainWithThunder: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavyRainWithThunder: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .patchyLightSnowWithThunder: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    case .moderateOrHeavySnowWithThunder: imageName = Day ? weatherType.dayIconCode : weatherType.nightIconName
    }
    return imageName
}
