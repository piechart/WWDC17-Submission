import UIKit.UIButton

public class GothamButton: UIButton {
  
  public override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    setTitleColor(.white, for: .normal)
    backgroundColor = .clear
    alpha = 0.95
    setupDefaultBorder()
  }
  
  init(frame: CGRect, title: String) {
    super.init(frame: frame)
    
    let titleAttributes = [
      NSFontAttributeName: UIFont.gothamPro(size: 13),
      NSForegroundColorAttributeName: UIColor.white,
      NSKernAttributeName: 1.5
      ] as [String : Any]
    let fixedTitle = title.hasPrefix("About") ? "\(title) me" : title
    let attributedTitle = NSAttributedString(string: fixedTitle.uppercased(), attributes: titleAttributes)
    setAttributedTitle(attributedTitle, for: .normal)
    
  }
  
  var fixedTitle: String {
    var title = currentAttributedTitle!.string.lowercased().capitalized
    if title.contains(" ") {
      title = title.components(separatedBy: " ").first!
    }
    return title
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
