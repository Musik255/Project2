
import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    @IBOutlet weak var labelScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        
        
        askQuestion(action : nil)
    }
    func askQuestion(action : UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        labelScore.text = "Your score is \(score)"
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if score == 10{
            return
        }
    
        var title : String
        var message : String
        if sender.tag == correctAnswer{
            
            score += 1
            title = "Correct"
            message = "Your score now is \(score)."
            if score == 10{
                message = "Your score now is \(score). \nGame has finish"
            }
        }
        else{
            score -= 1
            title = "Wrong! That’s the flag of \(countries[sender.tag])"
            message = "Your score now is \(score)."
        }
        let action = UIAlertController(title: title, message: message, preferredStyle: .alert)
        action.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(action, animated: true)
        
    }

}

