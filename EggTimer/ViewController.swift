import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggtimes = ["Soft":3,"Meduim":420, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggtimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime{
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
             
        } else{
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
}
