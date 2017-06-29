import UIKit

public class AboutMeViewController: BaseViewController {

  var imageView: UIImageView!
  var descriptionLabel: UILabel!
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "About me"
    initImageView()
    initLabel()
  }
  
}

// MARK: - UI
public extension AboutMeViewController {
  
  func initImageView() {
    let width = view.frame.width * 0.6
    let rect = CGRect(
      x: view.frame.midX - width * 0.5,
      y: 50,
      width: width,
      height: view.frame.height * 0.3
    )
    imageView = UIImageView(frame: rect)
    imageView.contentMode = .scaleAspectFill
    imageView.layer.radius = 15
    imageView.setupDefaultBorder()
    imageView.image = UIImage(named: "Photos/garage.jpg")
    view.addSubview(imageView)
  }

  func initLabel() {
    let yValue = imageView.frame.origin.y + imageView.frame.height + 5 
    let rect = CGRect(
      x: 10,
      y: yValue,
      width: view.frame.width - 20,
      height: view.frame.height - yValue
    )
    descriptionLabel = TopAlignmentLabel(frame: rect)
    descriptionLabel.backgroundColor = view.backgroundColor
    descriptionLabel.font = UIFont.gothamPro(size: 14.5)
    descriptionLabel.textColor = .white
    let desc = "\nMy name is Michael Galperin.\n\nI'm from Russia, Saint-Petersburg, \n\nstudying CS at ITMO University."
    descriptionLabel.text = desc
    descriptionLabel.numberOfLines = 0
    view.addSubview(descriptionLabel)
  }

}
