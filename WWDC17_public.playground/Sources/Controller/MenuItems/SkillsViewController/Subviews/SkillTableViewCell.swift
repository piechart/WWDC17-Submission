import UIKit.UITableViewCell

public class SkillTableViewCell: UITableViewCell {
  
  var contentLabel: LeftPaddingLabel!
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    separatorInset = .zero
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = Style.playgroundLightBackgroundColor
    selectionStyle = .none
    initContentLabel()
  }
  
  private func initContentLabel() {
    contentLabel = LeftPaddingLabel(frame: frame)
    contentLabel.textColor = .white
    contentLabel.backgroundColor = backgroundColor
    contentLabel.font = UIFont.gothamPro(size: 16)
    addSubview(contentLabel)
  }
  
  func hideSeparator() {
    separatorInset = UIEdgeInsets(top: 0, left: frame.width, bottom: 0, right: 0)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

public class LeftPaddingLabel: UILabel { 
  public override func drawText(in rect: CGRect) {
    var newRect = rect
    newRect.origin.x += 10
    super.drawText(in: newRect)
  }
}
