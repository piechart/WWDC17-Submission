///
/// Michael Galperin
///

import UIKit
import PlaygroundSupport

registerFonts()
setupNavigationBarAppearance()

let window = UIWindow(frame: CGRect(origin: .zero, size: Style.playgroundWindowSize))

window.rootViewController = WelcomeViewController()
window.makeKeyAndVisible()

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = window