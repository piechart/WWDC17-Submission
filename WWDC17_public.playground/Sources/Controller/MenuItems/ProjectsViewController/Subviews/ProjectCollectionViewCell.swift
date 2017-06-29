import UIKit.UICollectionViewCell

public class ProjectCollectionViewCell: UICollectionViewCell {

  var imageView: UIImageView!
  var titleLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = Style.playgroundLightBackgroundColor
    initImageView()
    initLabel()
  }

  func configure(with item: Project) {
    titleLabel.text = item.shortTitle
    imageView.image = UIImage(named: item.imageName)
  }
  
  func initImageView() {
    imageView = UIImageView()
    imageView.backgroundColor = .white
    imageView.contentMode = .scaleAspectFill
    imageView.layer.radius = 15
    addSubview(imageView)
    imageView.anchor(top: topAnchor)
    imageView.anchor(centerX: centerXAnchor)
    imageView.anchor(widthAnchor: widthAnchor, heightAnchor: heightAnchor, widthMultiplier: 0.8, heightMultiplier: 0.7)
  }
  
  func initLabel() {
    titleLabel = BaseLabel()
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.gothamPro(size: 11)
    addSubview(titleLabel)
    titleLabel.anchor(widthAnchor: widthAnchor, heightAnchor: heightAnchor, heightMultiplier: 0.3)
    titleLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
