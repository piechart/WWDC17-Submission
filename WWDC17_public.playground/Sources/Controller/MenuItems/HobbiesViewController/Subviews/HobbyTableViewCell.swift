import UIKit.UITableViewCell

public class HobbyTableViewCell: UITableViewCell {

  private var photoImageView: UIImageView!
  private var descriptionLabel: UILabel!

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = Style.playgroundLightBackgroundColor
    selectionStyle = .none
    initImageView()
    initDescriptionLabel()
  }
  
  func configure(with: Hobby) {
    photoImageView.image = UIImage(named: with.imageName)
    descriptionLabel.setTextWithIndent(text: with.description)
  }
  
  func initImageView() {
    photoImageView = UIImageView()
    photoImageView.layer.radius = 4
    photoImageView.setupDefaultBorder()
    photoImageView.contentMode = .scaleAspectFill
    addSubview(photoImageView)
    photoImageView.anchor(
      leading: leadingAnchor,
      top: topAnchor,
      trailing: trailingAnchor,
      leadingConstant: 8,
      topConstant: 4,
      trailingConstant: -8,
      heightConstant: 150
    ) 
  }
  
  func initDescriptionLabel() {
    descriptionLabel = BaseLabel()
    descriptionLabel.font = UIFont.gothamPro(size: 13)
    addSubview(descriptionLabel)
    descriptionLabel.anchor(
      leading: photoImageView.leadingAnchor,
      top: photoImageView.bottomAnchor,
      trailing: photoImageView.trailingAnchor,
      bottom: bottomAnchor,
      topConstant: 6,
      bottomConstant: -8
    )
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
