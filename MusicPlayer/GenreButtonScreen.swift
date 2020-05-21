//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by junhyuk on 2020/05/21.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func genrenButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            
            if status == .authorized {
                self.playerGenre(genre: sender.currentTitle!)
                
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        musicPlayer.stop()
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        musicPlayer.skipToNextItem()
        
    }
    
    func playerGenre(genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
    }
    
}
