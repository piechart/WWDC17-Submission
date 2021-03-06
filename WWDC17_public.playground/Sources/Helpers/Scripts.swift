import Foundation

struct scripts {
  static let welcome: [TypeCommand] = [
    wait(.long),
    showEnter("Last login: Wed Mar 22 20:27:16 on ttys002"),
    showln("MbPM: "),
    wait(.long),
    type("swift"),
    newLine,
    wait(.short),
    showln("Welcome to Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)"),
    showln("  1> "),
    wait,
    type("import WWDCScholarship"),
    wait(.short),
    newLine,
    showEnter("  2> "),
    wait,
    type("let greeting = HelloMessage()"),
    wait(.short),
    newLine,
    showEnter("  3> "),
    wait,
    type("greeting.show()"),
    newLine,
    wait,
    newLine,
    type("Welcome to my WWDC 2017 playground!"),
    wait(.short),
    newLine,
    newLine,
    type("I know that reviewing this staff is not as cool as daily world changing"),
    wait,
    newLine,
    newLine,
    type("That's why since before we've started, I want to thank you for your time!"),
    wait,
    newLine,
    newLine,
    type("Once you're ready, "),
    wait(.long),
    type("welcome!"),
    wait(.long),
    newLine,
    showln("^C")
  ]
  static let finish: [TypeCommand] = [
    wait(.long),
    showEnter("  1> import WWDCScholarship\n"),
    showEnter("  2> let greeting = HelloMessage()\n"),
    showEnter("  3> greeting.show()\n"),
    wait(.long),
    showEnter("  4> "),
    wait,
    type("greeting.finalize()"),
    newLine,
    wait(.long),
    showEnter("141976: not yet. One more thing"),
    newLine,
    newLine,
    wait(.long),
    type("try"),
    wait(.short),
    type(" wwdcScholars.append(me)"),
    newLine,
    wait(.long),
    newLine,
    showln("^C"),
    wait(.long)
  ]
}
