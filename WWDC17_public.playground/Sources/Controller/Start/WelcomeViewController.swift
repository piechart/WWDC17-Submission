import UIKit

public class WelcomeViewController: CommandLineViewController {
  
  override var script: [TypeCommand] {
    return scripts.welcome
  }

  override func typingFinished() {
    super.typingFinished()
    
    let buttonRect = CGRect(x: 8, y: Style.playgroundWindowSize.height - 64, width: view.frame.width - 16, height: 56)
    let buttonBegin = GothamButton(frame: buttonRect, title: "Begin")
    buttonBegin.addTarget(self, action: #selector(beginButtonTapped), for: .touchUpInside)
    
    buttonBegin.alpha = 0
    view.addSubview(buttonBegin)
    UIView.animate(withDuration: 0.95, animations: { 
      buttonBegin.alpha = 1
    })
  }
  
}

extension WelcomeViewController {
  
  func beginButtonTapped() {
    let mainViewController = MainViewController()
    mainViewController.modalTransitionStyle = .flipHorizontal
    let navigationController = UINavigationController(rootViewController: mainViewController)
    present(navigationController, animated: true)

    startPlayingBackgroundMusic()
  }
}
