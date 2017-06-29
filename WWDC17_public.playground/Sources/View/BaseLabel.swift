import UIKit.UILabel 

public class BaseLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = Style.playgroundLightBackgroundColor
    textColor = .white
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
