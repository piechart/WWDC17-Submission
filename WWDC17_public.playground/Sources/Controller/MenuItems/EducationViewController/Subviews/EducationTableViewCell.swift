import UIKit.UITableViewCell

public class EducationTableViewCell: UITableViewCell {

  private var circleView: UIView!
  private var lineView: UIView!
  private var titleLabel: UILabel!
  private var descriptionLabel: UILabel!
  private var dateLabel: UILabel!

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = Style.playgroundLightBackgroundColor
    selectionStyle = .none
    initLineView()
    initCircleView()
    initLabels()
  }
  
  func configure(with item: EducationTableItem) {
    titleLabel?.text = item.title
    dateLabel?.text = item.period
    descriptionLabel?.setTextWithIndent(text: item.description)
  }
  
  func initCircleView() {
    circleView = UIView()
    circleView.backgroundColor = .white
    circleView.layer.radius = 6
    addSubview(circleView)
    circleView.anchor(centerX: lineView.centerXAnchor, centerY: centerYAnchor)
    circleView.anchor(heightConstant: 12, widthConstant: 12)
  }
  
  func initLineView() {
    lineView = UIView()
    lineView.backgroundColor = .white
    addSubview(lineView)
    lineView.anchor(
      leading: leadingAnchor,
      top: topAnchor,
      bottom: bottomAnchor,
      leadingConstant: 20,
      widthConstant: 1
    )
  }
  
  func initLabels() {
    titleLabel = BaseLabel()
    titleLabel.font = UIFont.gothamProBold(size: 16)
    addSubview(titleLabel)
    titleLabel.anchor(
      leading: circleView.trailingAnchor,
      top: topAnchor,
      trailing: trailingAnchor,
      leadingConstant: 8,
      topConstant: 3,
      trailingConstant: -16,
      heightConstant: 21
    )
    descriptionLabel = BaseLabel()
    descriptionLabel.font = UIFont.gothamPro(size: 13)
    addSubview(descriptionLabel)
    let dateLabelHeight: CGFloat = 10
    descriptionLabel.anchor(
      leading: titleLabel.leadingAnchor,
      top: titleLabel.bottomAnchor,
      trailing: titleLabel.trailingAnchor,
      bottom: bottomAnchor,
      bottomConstant: -(dateLabelHeight + 8)
    )
    dateLabel = BaseLabel()
    dateLabel.font = UIFont.gothamPro(size: 12)
    dateLabel.textAlignment = .right
    addSubview(dateLabel)
    dateLabel.anchor(
      leading: descriptionLabel.leadingAnchor,
      top: descriptionLabel.bottomAnchor,
      trailing: descriptionLabel.trailingAnchor,
      topConstant: 4,
      heightConstant: dateLabelHeight
    )
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
