import UIKit

public class ThanksViewController: BaseViewController {

  struct Constants {
    static let name = "Michael"
    static let status = "Scholarship"
    static let thanksForReviewing = "Thanks for reviewing!"
    static let seeYou = "See you in San Jose?"
  }
  
  var badgeView: UIView!
  var thanksLabel: UILabel!
  var seeYouLabel: UILabel!
  
  let badgeAnimationDuration: TimeInterval = 3
  let finalBadgeYOrigin: CGFloat = 40

  public override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Style.thanksControllerBackgroundColor
    initBadgeView()
    initThanksLabel()
    initSeeYouLabel()
  }

  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    animateBadgeView()
  }
    
}

// MARK: - UI
extension ThanksViewController {
  
  func initBadgeView() {
    let badgeWidth = view.frame.width * 0.4
    let badgeHeight = view.frame.height * 0.4
    let badgeRect = CGRect(
      x: view.center.x - badgeWidth * 0.5,
      y: -badgeHeight,
      width: badgeWidth,
      height: badgeHeight
    )
    badgeView = UIView(frame: badgeRect)
    badgeView.layer.radius = 9

    let topView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: badgeRect.width, height: badgeRect.height * 0.35)))
    topView.backgroundColor = .white
    badgeView.addSubview(topView)

    let bottomView = UIView(frame: CGRect(x: 0, y: topView.frame.height, width: badgeRect.width, height: badgeRect.height * 0.65))
    bottomView.backgroundColor = UIColor(red: 80 / 255, green: 227 / 255, blue: 194 / 255, alpha: 1)
    badgeView.addSubview(bottomView)

    let midX = badgeWidth * 0.5
    let holeRect = CGRect(x: midX - 15, y: 8, width: 30, height: 7)
    let holeView = UIView(frame: holeRect)
    holeView.backgroundColor = Style.thanksControllerBackgroundColor
    holeView.layer.radius = 4
    topView.addSubview(holeView)

    let nameRect = CGRect(
      x: 10,
      y: bottomView.frame.height * 0.3,
      width: 70,
      height: 25
    )
    let nameLabel = UILabel(frame: nameRect)
    nameLabel.font = UIFont.gothamProBold(size: 12)
    nameLabel.text = Constants.name
    bottomView.addSubview(nameLabel)

    let descRect = CGRect(
      x: 10,
      y: nameRect.origin.y + nameRect.height * 0.65,
      width: 60,
      height: 20
    )
    let descLabel = UILabel(frame: descRect)
    descLabel.font = UIFont.gothamPro(size: 9)
    descLabel.textColor = .black
    descLabel.text = Constants.status
    bottomView.addSubview(descLabel)

    let logoRect = CGRect(
      x: 10,
      y: badgeRect.height * 0.175,
      width: badgeRect.width * 0.5,
      height: 35
    )
    let logoImageView = UIImageView(frame: logoRect)
    logoImageView.contentMode = .scaleAspectFit
    logoImageView.image = UIImage(named: "wwdc-lockup.png")
    badgeView.addSubview(logoImageView)

    view.addSubview(badgeView)
  }
  
  func animateBadgeView() {
    UIView.animate(
      withDuration: badgeAnimationDuration,
      delay: 0,
      usingSpringWithDamping: 0.75,
      initialSpringVelocity: 3,
      options: .curveEaseInOut,
      animations: {
        self.badgeView.frame.origin.y = self.finalBadgeYOrigin
      }, 
      completion: { animationFinished in 
        if animationFinished {
          self.makeLabelsAppear()
        }
      }
    )
  }
  
  private func makeLabelsAppear() {
    UIView.animate(withDuration: 1.0, animations: { 
      self.thanksLabel.alpha = 1
      self.seeYouLabel.alpha = 1
    })
  }
  
  func initThanksLabel() {
    let rect = CGRect(
      x: 0,
      y: finalBadgeYOrigin + badgeView.frame.height + 15,
      width: view.frame.width,
      height: 25
    )
    thanksLabel = FadeLabel(frame: rect)
    thanksLabel.font = UIFont.gothamProBold(size: 16)
    thanksLabel.text = Constants.thanksForReviewing
    view.addSubview(thanksLabel)
  }
  
  func initSeeYouLabel() {
    let seeRect = CGRect(
      x: 0,
      y: thanksLabel.frame.origin.y + thanksLabel.frame.height + 8,
      width: view.frame.width,
      height: 15
    )
    seeYouLabel = FadeLabel(frame: seeRect)
    seeYouLabel.font = UIFont.gothamPro(size: 11)
    seeYouLabel.text = Constants.seeYou
    view.addSubview(seeYouLabel)
  }
  
}
