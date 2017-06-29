import UIKit.UILabel

extension UILabel {

  func setTextWithIndent(text: String, indent: CGFloat = 5) {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = indent

    let attributedStr = NSMutableAttributedString(string: text)
    attributedStr.addAttribute(
      NSParagraphStyleAttributeName,
      value: paragraphStyle,
      range: NSRange(location: 0, length: attributedStr.length)
    )

    numberOfLines = 0
    attributedText = attributedStr
  }

}
