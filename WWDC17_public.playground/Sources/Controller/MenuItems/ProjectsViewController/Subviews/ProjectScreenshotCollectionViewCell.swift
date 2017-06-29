import UIKit.UICollectionViewCell

public class ProjectScreenshotCollectionViewCell: UICollectionViewCell {
  
  var imageView: UIImageView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .clear
    initImageView()
  }
  
  func initImageView() {
    imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.layer.radius = 4
    addSubview(imageView)
    imageView.anchor(
      leading: leadingAnchor,
      top: topAnchor,
      trailing: trailingAnchor,
      bottom: bottomAnchor
    )
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
