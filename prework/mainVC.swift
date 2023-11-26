//
//  mainVC.swift
//  preworkIOS102
//
//  Created by Darian Lee on 11/26/23.
//

import UIKit

class mainVC: UIViewController {
    var first: String?
    var last: String?
    var school: String?
    var pets: Int?
    var myYear: String?
    @IBOutlet weak var numPets: UILabel!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var introduce: UIButton!
    @IBOutlet weak var year: UISegmentedControl!
    @IBOutlet weak var `switch`: UISwitch!
    
    @IBOutlet weak var plusMinus: UIStepper!
    override func viewDidLoad() {
        pets = 0
        numPets.text = String(pets!)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func stepperDidChange(_ sender: UIStepper) {

          numPets.text = "\(Int(sender.value))"
      }
    @IBAction func didPressIntroduce(_sender: UIButton) {
        guard firstName.text != "", lastName.text != "", schoolName.text != ""
        else{
            let alertController = UIAlertController(title: "Missing Information", message: "Please fill in all the required fields.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
            
            return
        }
        first = firstName.text
        last = lastName.text
        school = schoolName.text
        myYear = year.titleForSegment(at: year.selectedSegmentIndex)
        
        let introduction = "My name is \(first!) \(last!) and I attend \(school!). I am currently in my \(myYear!) year and I own \(numPets.text!) pets. It is \(`switch`.isOn) that I want more pets."


                // Creates the alert where we pass in our message, which our introduction.
                let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

                // A way to dismiss the box once it pops up
                let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)

                // Passing this action to the alert controller so it can be dismissed
                alertController.addAction(action)

                present(alertController, animated: true, completion: nil)
            }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


