import Foundation

extension String {
  func substring(from index: Int) -> String {
    return substring(from: characters.index(startIndex, offsetBy: index))
  }
  
  func substring(with range: Range<Int>) -> String {
    let startIndex = characters.index(self.startIndex, offsetBy: range.lowerBound)
    let endIndex = characters.index(self.startIndex, offsetBy: range.upperBound)
    return substring(with: startIndex ..< endIndex)
  }
}
