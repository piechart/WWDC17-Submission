import UIKit

typealias TypeCommand = (String, String?)

enum TimeToWait {
  case short, long
}

enum Command: String {
  case enter, showAndNewline, typeIn, wait, waitShort, waitLong
}

let newLine: TypeCommand = (Command.showAndNewline.rawValue, "")

func showEnter(_ message: String) -> TypeCommand {
  return (Command.enter.rawValue, message)
}

func showln(_ message: String) -> TypeCommand {
  return (Command.showAndNewline.rawValue, message)
}

func type(_ message: String) -> TypeCommand {
  return (Command.typeIn.rawValue, message)
}

func wait(_ time: TimeToWait) -> TypeCommand {
  switch(time) {
  case .short: return (Command.waitShort.rawValue, nil)
  case .long: return (Command.waitLong.rawValue, nil)
  }
}

let wait: TypeCommand = (Command.wait.rawValue, nil)

func delay(_ delay: TimeInterval, block: @escaping () -> Void) {
  Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
}

public class CommandLineViewController: BaseViewController {
  
  var messageLabel: TopAlignmentLabel!
  var messageText = ""
  var currentCommand = 0
  var typedIndex = 0

  var script: [TypeCommand] {
    return []
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .black
    initLabel()
  }
  
  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    performCommand(command: script.first!)
  }
  
  private func initLabel() {
    let labelRect = CGRect(x: 8, y: 8, width: Style.playgroundWindowSize.width - 8, height: Style.playgroundWindowSize.height - 16)
    messageLabel = TopAlignmentLabel(frame: labelRect)
    messageLabel.textColor = .white
    messageLabel.numberOfLines = 0
    messageLabel.font = UIFont(name: "Menlo-Regular", size: 12)
    view.addSubview(messageLabel)
  }
  
  func addText(_ text: String) {
    messageText = "\(messageText)\(text)"
    messageLabel.text = "\(messageText)█"
  }
  
  func performCommand(command: (String, String?)) {
    let value = command.1
    
    let cmd = Command(rawValue: command.0)!

    switch cmd {
    case .enter:
      addText(value!)
      performNextCommand()
    case .showAndNewline:
      addText("\n\(value!)")
      performNextCommand()
    case .typeIn:
      typeWord(value!) {
        self.performNextCommand()
      }
    case .waitShort:
      delay(0.5, block: {
        self.performNextCommand()
      })
    case .wait:
      delay(1.0, block: {
        self.performNextCommand()
      })
    case .waitLong:
      delay(1.5, block: {
        self.performNextCommand()
      })
    }
  }
  
  func typeWord(_ word: String, completion: @escaping () -> Void) {
    let char = word.characters[word.index(word.startIndex, offsetBy: typedIndex)]
    
    addText(String(char))
    
    typedIndex += 1
    
    if typedIndex < word.characters.count {
      delay(0.07, block: {
        self.typeWord(word, completion: completion)
      })
    } else {
      typedIndex = 0
      completion()
    }
  }
  
  func performNextCommand() {
    currentCommand += 1
    if currentCommand < script.count {
      performCommand(command: script[currentCommand])
    } else {
      typingFinished()
    }
  }

  func typingFinished() {
    //
  }
  
}
