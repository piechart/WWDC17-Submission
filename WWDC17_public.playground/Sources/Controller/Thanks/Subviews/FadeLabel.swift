import UIKit.UILabel

public class FadeLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    textColor = Style.playgroundDarkBackgroundColor
    textAlignment = .center
    alpha = 0
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
