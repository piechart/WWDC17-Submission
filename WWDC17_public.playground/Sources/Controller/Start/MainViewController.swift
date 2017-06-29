import UIKit

public class MainViewController: BaseViewController {
  
  fileprivate enum ButtonTitle: String {
    case About, Skills, Education, Hobbies, Projects
    static var allValues: [ButtonTitle] {
      return [.About, .Skills, .Education, .Hobbies, .Projects]
    }
  }
  
  var backgroundImageView: BackgroundImageView!
  var visitedScreensCount = 0
  
  override public func viewDidLoad() {
    super.viewDidLoad()

    initBackground()
    initMenu()
  }
  
  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    backgroundImageView.beginAnimating()

    if visitedScreensCount == ButtonTitle.allValues.count {
      
      backgroundImageView.endAnimating()
      
      let finishingViewController = FinishingViewController()
      
      let blackView = UIView(frame: view.frame)
      let blurView = UIVisualEffectView(frame: view.frame)
      blackView.backgroundColor = .black
      blackView.alpha = 0
      view.addSubview(blurView)
      view.addSubview(blackView)
      
      UIView.animate(withDuration: 2.5, animations: {
        blurView.effect = UIBlurEffect(style: .dark)
        blackView.alpha = 1
      }, completion: { finished in
        if finished {
          blurView.removeFromSuperview()
          blackView.removeFromSuperview()
          self.view.addSubview(finishingViewController.view)
          endPlayingBackgroundMusic()
        }
      })
    }
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    backgroundImageView.endAnimating()
    setEmptyBackButton()
  }
  
  func menuButtonTapped(button: GothamButton) {
    guard button.frame.height > 1 else { // checks if already tapped (btw, very thin to tap)
      return
    }
    let nextViewController: UIViewController

    switch ButtonTitle(rawValue: button.fixedTitle)! { // imagine it's safe
      case .About: nextViewController = AboutMeViewController()
      case .Skills: nextViewController = SkillsViewController()
      case .Education: nextViewController = EducationViewController()
      case .Hobbies: nextViewController = HobbiesViewController()
      case .Projects: nextViewController = ProjectsViewController()
    }
    animateHeightMinimizing(button, nextViewController: nextViewController)
    visitedScreensCount += 1
  }
  
}

// MARK: - Buttons animation
public extension MainViewController {
  
  func animateHeightMinimizing(_ button: UIButton, nextViewController: UIViewController) {
    let actualHeight = button.frame.height
    UIView.animate(withDuration: 0.35, animations: { 
      button.frame.size.height = 1
      button.frame.origin.y += (actualHeight / 2)
    }, completion: { finished in
      if finished {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { 
          self.navigationController?.pushViewController(nextViewController, animated: true)
        }
      }
    })
  }
  
}

// MARK: - UI, Initializers
public extension MainViewController {
  
  func initBackground() {
    backgroundImageView = BackgroundImageView(frame: view.frame)
    view.addSubview(backgroundImageView)
    view.sendSubview(toBack: backgroundImageView)
    
    let blurView = UIView(frame: view.frame)
    blurView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    view.addSubview(blurView)
  }
  
  func initMenu() {
    
    let stackRect = CGRect(
      x: view.frame.width * 0.2,
      y: 20,
      width: view.frame.width * 0.6,
      height: view.frame.height - 40
    )
    let stackView = menuStackViewWith(rect: stackRect)

    ButtonTitle.allValues.forEach {
      let button = GothamButton(frame: .zero, title: $0.rawValue)
      button.addTarget(self, action: #selector(menuButtonTapped(button:)), for: .touchUpInside)
      stackView.addArrangedSubview(button)
    }
    view.addSubview(stackView)
  }
  
  func menuStackViewWith(rect: CGRect) -> UIStackView {
    let stack = UIStackView(frame: rect)
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.spacing = 8
    stack.axis = .vertical
    return stack
  }
}
