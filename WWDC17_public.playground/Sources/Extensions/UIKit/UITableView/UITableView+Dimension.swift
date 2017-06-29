import UIKit.UITableView

extension UITableView {
  
  func setupAutomaticHeightCounting() {
    estimatedRowHeight = 100
    rowHeight = UITableViewAutomaticDimension
  }
  
}
