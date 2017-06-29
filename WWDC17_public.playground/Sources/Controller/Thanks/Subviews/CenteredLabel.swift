import UIKit.UILabel

public class CenteredLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    textColor = .white
    textAlignment = .center
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
