import UIKit

public class FinishingViewController: CommandLineViewController {
  
  override var script: [TypeCommand] {
    return scripts.finish
  }

  override func typingFinished() {
    super.typingFinished()

    let thanksViewController = ThanksViewController()
    
    let whiteView = UIView(frame: view.frame)
    whiteView.backgroundColor = Style.thanksControllerBackgroundColor
    whiteView.alpha = 0
    let blurView = UIVisualEffectView(frame: view.frame)
    view.addSubview(blurView)
    view.addSubview(whiteView)
    UIView.animate(withDuration: 3.0, animations: {
      whiteView.alpha = 1
      blurView.effect = UIBlurEffect(style: .extraLight)
    }) { finished in
      if finished {
        whiteView.removeFromSuperview()
        blurView.removeFromSuperview()
        self.view.addSubview(thanksViewController.view)
      }
    }
  }
  
}
