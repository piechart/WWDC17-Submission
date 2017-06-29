import UIKit.UIFont

public struct Style {
  public static let playgroundWindowSize = CGSize(width: 275, height: 430)
  public static let playgroundLightBackgroundColor = UIColor(hexString: "6C6C6C")
  public static let playgroundDarkBackgroundColor = UIColor(hexString: "#2C2A36")
  public static let thanksControllerBackgroundColor = UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1) 
}

public func registerFonts() {
  let normalFontURL = Bundle.main.url(forResource: "Fonts/GothamPro", withExtension: "ttf")
  CTFontManagerRegisterFontsForURL(normalFontURL! as CFURL, .process, nil)
  let boldFontURL = Bundle.main.url(forResource: "Fonts/GothamPro-Bold", withExtension: "otf")
  CTFontManagerRegisterFontsForURL(boldFontURL! as CFURL, .process, nil)
}

public extension UIFont {
  
  static func gothamPro(size: CGFloat) -> UIFont {
    return UIFont(name: "GothamPro", size: size)!
  }
  
  static func gothamProBold(size: CGFloat) -> UIFont {
    return UIFont(name: "GothamPro-Bold", size: size)!
  }
  
}

public func setupNavigationBarAppearance() {
  UINavigationBar.appearance().tintColor = .white
  UINavigationBar.appearance().barTintColor = .clear
  UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
  UINavigationBar.appearance().isTranslucent = true
  UINavigationBar.appearance().shadowImage = UIImage()
  
  let titleTextAttributes = [
    NSFontAttributeName: UIFont.gothamPro(size: 14),
    NSForegroundColorAttributeName: UIColor.white,
    NSKernAttributeName: 1.5
    ] as [String: Any]
  UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
}
