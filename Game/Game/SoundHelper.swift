//
//  SoundHelper.swift
//  Game
//
//  Created by Albert Rayneer on 13/10/20.
//

import Foundation
import AVFoundation

enum SoundType: String {
    case lose = "loseSound"
    case win = "winSound"
    case ball = "ballSound"
}

class SoundHelper {
    static let shared = SoundHelper()
    var audioPlayer: AVAudioPlayer!
    var musicPlayer: AVAudioPlayer!
    
    func playSound(ofType type: SoundType) {
        if let musicURL = Bundle.main.url(forResource: type.rawValue, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: musicURL)
                audioPlayer.prepareToPlay()
            } catch {
                print("Unable to play music: \(error.localizedDescription)")
            }
        } else {
            print("Unable to find music file")
        }
        audioPlayer.play()
    }
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "mp3") {
            do {
                musicPlayer = try AVAudioPlayer(contentsOf: musicURL)
                musicPlayer.numberOfLoops = -1
                musicPlayer.volume = 0.4
                musicPlayer.prepareToPlay()
            } catch {
                print("Unable to play music: \(error.localizedDescription)")
            }
        } else {
            print("Unable to find music file")
        }
        musicPlayer.play()
    }
}
