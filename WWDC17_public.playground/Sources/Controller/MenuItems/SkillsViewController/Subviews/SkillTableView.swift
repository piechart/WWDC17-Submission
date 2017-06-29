import UIKit.UITableView

public class SkillTableView: UITableView {
  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    
    layer.radius = 12
    setupDefaultBorder()
    separatorColor = UIColor.white
    separatorInset = UIEdgeInsets.zero
    backgroundColor = Style.playgroundLightBackgroundColor
    showsVerticalScrollIndicator = false
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

