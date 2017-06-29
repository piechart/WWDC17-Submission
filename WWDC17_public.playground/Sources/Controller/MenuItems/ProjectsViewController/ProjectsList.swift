import Foundation

public struct Project {
  let shortTitle: String
  let fullTitle: String
  let imageName: String
  let screenshots: [String]
  let description: String
}

struct DirTitle {
  static let akbooks = "AkBooks"
  static let dreamCal = "DreamCalendar"
  static let ett = "ETT"
  static let paperd = "PaperdKeyboard"
  static let sberbox = "Sberbox"
  static let smartHome = "SmartHome"
  static let sportTips = "SportTips"
  static let tempMail = "TempMail"
}

extension String {
  func screensPath(_ title: String) -> String {
    return "Projects/\(title)/\(self)"
  }
  var iconPath: String {
    return "Projects/\(self)/icon.png"
  }
}

public let projects = [
  Project(
    shortTitle: "DreamCal",
    fullTitle: DirTitle.dreamCal,
    imageName: DirTitle.dreamCal.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.dreamCal),
      "screen2.png".screensPath(DirTitle.dreamCal),
      "screen3.png".screensPath(DirTitle.dreamCal)
    ],
    description: "This is a calendar with ability to write your ideas down - like calendar with notes. Pretty simple interface, ability of rich text editing and pictures inserting"
  ),
  Project(
    shortTitle: "AkBooks",
    fullTitle: DirTitle.akbooks,
    imageName: DirTitle.akbooks.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.akbooks)
    ],
    description: "This app was made for specific publishing house specialized on studying literature. Easy-to-use EPUB reader with contents screen"
  ),
  Project(
    shortTitle: "SmartHome",
    fullTitle: DirTitle.smartHome,
    imageName: DirTitle.smartHome.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.smartHome),
      "screen2.png".screensPath(DirTitle.smartHome)
    ],
    description: "This app is a controller in your pocket for each smart thing in your house. You can manage the light state, temperature in rooms, create scenarios"
  ),
  Project(
    shortTitle: "SberBox",
    fullTitle: DirTitle.sberbox,
    imageName: DirTitle.sberbox.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.sberbox),
      "screen2.png".screensPath(DirTitle.sberbox),
      "screen3.png".screensPath(DirTitle.sberbox)
    ],
    description: "I was asked to make a demo application (with just beautiful UI) for abstract service that can union different cloud storages like Google Disk, iCloud or Dropbox."
  ),
  Project(
    shortTitle: "TempMail",
    fullTitle: DirTitle.tempMail,
    imageName: DirTitle.tempMail.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.tempMail),
      "screen2.png".screensPath(DirTitle.tempMail)
    ],
    description: "App that provides access to free temp (up to 15 minutes life) mail boxes"
  ),
  Project(
    shortTitle: "PaperdKB",
    fullTitle: DirTitle.paperd,
    imageName: DirTitle.paperd.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.paperd)
    ],
    description: "This is custom iOS keyboard which does linguistic analysis with text entered and finds relevant images for nouns found."
  ),
  Project(
    shortTitle: "ETT",
    fullTitle: DirTitle.ett,
    imageName: DirTitle.ett.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.ett),
      "screen2.png".screensPath(DirTitle.ett)
    ],
    description: "This is a calculator that helps customers to order delivery of their cargo between cities.  User has possibility to enter it's weight & size, direction"
  ),
  Project(
    shortTitle: "SportTips",
    fullTitle: DirTitle.sportTips,
    imageName: DirTitle.sportTips.iconPath,
    screenshots: [
      "screen1.png".screensPath(DirTitle.sportTips),
      "screen2.png".screensPath(DirTitle.sportTips)
    ],
    description: "App with news and tips to bet (or not to bet, that's a question). There is an option to store data in iCloud"
  )
]
