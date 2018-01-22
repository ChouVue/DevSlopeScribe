//
//  ViewController.swift
//  DevSlopeScribe
//
//  Created by Chou Vue on 1/22/18.
//  Copyright © 2018 VUE. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class MainVC: UIViewController {

    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTxtField: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activitySpinner.isHidden = true
    }

    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization {
            authStatus in
            
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "text", withExtension: "m4a"){
                    do{
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        sound.play()
                    }
                    catch{
                        print("Error!")
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechRecognitionRequest()
                    recognizer?.recognitionTask(with: request) {
                        (result, error) in
                        
                        if let error = error {
                            print("Error: \(error)")
                        }
                        else {
                            print(result?.bestTranscription.formattedString)
                        }
                    }
                }
            }
        }
    }
}

