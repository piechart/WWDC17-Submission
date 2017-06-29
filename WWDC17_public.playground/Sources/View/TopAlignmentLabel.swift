import UIKit.UILabel

class TopAlignmentLabel: UILabel {
  
  override func drawText(in rect: CGRect) {
    guard let text = text else {
      super.drawText(in: rect)
      return
    }
    let labelTextSize = (text as NSString).boundingRect(
      with: CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude),
      options: .usesLineFragmentOrigin,
      attributes: [NSFontAttributeName: font],
      context: nil
    ).size
    let drawRect = CGRect(
      x: 0,
      y: 0,
      width: self.frame.width,
      height: ceil(labelTextSize.height)
    )
    super.drawText(in: drawRect)
  }
}
