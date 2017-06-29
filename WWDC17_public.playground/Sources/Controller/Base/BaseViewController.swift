import UIKit

public class BaseViewController: UIViewController {

  public override var title: String? {
    didSet {
      navigationItem.title = title?.uppercased()
    }
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    automaticallyAdjustsScrollViewInsets = false
    initView()
  }
  
  func initView() {
    let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: Style.playgroundWindowSize)
    view.frame = rect
    view.backgroundColor = Style.playgroundLightBackgroundColor
  }
}
