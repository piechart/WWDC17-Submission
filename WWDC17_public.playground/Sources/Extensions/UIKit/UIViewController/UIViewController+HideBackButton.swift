import UIKit.UIViewController

extension UIViewController {
  
  func setEmptyBackButton() {
    let backButton = UIBarButtonItem()
    backButton.title = ""
    navigationItem.backBarButtonItem = backButton
  }
  
}
