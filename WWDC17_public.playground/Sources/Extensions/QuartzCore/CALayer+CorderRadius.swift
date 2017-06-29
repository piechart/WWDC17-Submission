import QuartzCore

extension CALayer {
  
  var radius: CGFloat {
    get {
      return cornerRadius
    }
    set {
      masksToBounds = true
      cornerRadius = newValue
    }
  }
  
}
