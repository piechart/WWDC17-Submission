import UIKit
import AVFoundation

var player: AVAudioPlayer?

public func startPlayingBackgroundMusic() {
  /// Keiko Matsui - Forever, Forever
  let track = Bundle.main.url(forResource: "background_sound", withExtension: "mp3")!
  do {
    player = try AVAudioPlayer(contentsOf: track)
    guard let player = player else {
      return
    }
    player.volume = 0.25
    player.numberOfLoops = 10
    player.prepareToPlay()
    player.play()
  } catch {
    print(error.localizedDescription)
  }
}

public func endPlayingBackgroundMusic() {
  guard player != nil else {
    return
  }
  if player!.volume > 0.1 {
    player!.volume -= 0.1
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: { 
      endPlayingBackgroundMusic()
    })
  } else {
    player!.stop()
  }
}
