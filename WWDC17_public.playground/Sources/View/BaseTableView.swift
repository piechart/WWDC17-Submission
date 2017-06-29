import UIKit.UITableView

public class BaseTableView: UITableView {
  
  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    
    backgroundColor = Style.playgroundLightBackgroundColor
    separatorColor = .clear
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
