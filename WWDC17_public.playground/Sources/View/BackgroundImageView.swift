import UIKit

public class BackgroundImageView: UIImageView {
  
  private let photosDirectoryTitle = "Photos"
  private let imageNames = ["brooklyn_br.jpg", "garage.jpg", "github_ava.jpg", "times_sq.jpg", "top_of_the_rock.jpg"]
  private var currentIndex = 0
  
  private var timer: Timer!
  
  private let frequencyDuration: TimeInterval = 4.95
  private let transitionDuration: TimeInterval = 0.55
  private var progressFlowDuration: TimeInterval {
    return frequencyDuration - transitionDuration
  }
  
  var progressView: UIProgressView!
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    
    initProgressView()
    contentMode = .scaleAspectFill
    setImageAnimatedWith(index: 0)
  }
  
  func initProgressView() {
    let rect = CGRect(x: 0, y: frame.height - 3, width: frame.width, height: 3)
    progressView = UIProgressView(frame: rect)
    progressView.progressViewStyle = .bar
    progressView.trackTintColor = .clear
    progressView.progressTintColor = .white
    addSubview(progressView)
  }

  // start/stop are already taken
  func beginAnimating() {
    setImageAnimatedWith(index: self.currentIndex)
    timer = Timer.scheduledTimer(withTimeInterval: frequencyDuration, repeats: true) { _ in
      self.currentIndex += 1
      if self.currentIndex == self.imageNames.count { // reached the last one
        self.currentIndex = 0
      }
      self.setImageAnimatedWith(index: self.currentIndex)
    }
  }
  
  func endAnimating() {
    timer.invalidate()
    setZeroProgress()
  }
  
  private func setZeroProgress() {
    progressView.setProgress(0, animated: false)
  }
  
  private func setImageAnimatedWith(index: Int) {
    setZeroProgress()
    let futureImageName = "\(photosDirectoryTitle)/\(imageNames[index])"

    UIView.transition(
      with: self,
      duration: transitionDuration,
      options: .transitionCrossDissolve,
      animations: { 
        self.image = UIImage(named: futureImageName)
      },
      completion: { finished in
        if finished {
          UIView.animate(withDuration: self.progressFlowDuration, animations: { 
            self.progressView.setProgress(1, animated: true)
          })
        }
      }
    )
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
