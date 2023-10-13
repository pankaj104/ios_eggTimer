import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggComplete: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
       
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 5, "Medium":7, "Hard":12]
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
       // progressBar.progress = 1.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        
         totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondPassed = 0
        eggComplete.text = hardness
        
        print(eggTimes[hardness]!)

       timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    
    }
    
    @objc func updateCounter() {
        if secondPassed < totalTime {
          //  print("\(counter) seconds  to the end of the world")

            secondPassed += 1

            let percetageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = Float(percetageProgress)
            print(percetageProgress)
        }
        else{
            timer.invalidate()
            eggComplete.text = "Your Egg is done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}

    


