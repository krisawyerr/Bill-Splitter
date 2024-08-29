import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var numberInput: UITextField!
    
//    var cost = 100.00
//    var percent = 0.0
//    var splitAmount = 1
    var calcBrain = CalculatorBrain()
    var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberInput.keyboardType = .decimalPad
        addDoneButtonOnKeyboard()
        
        numberInput.attributedPlaceholder = NSAttributedString(
            string: "e.g. 151.73",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }
    
    @IBAction func priceChanged(_ sender: Any) {
//        cost = Double(numberInput.text!) ?? 0.00
        calcBrain.updatePrice(newPrice: numberInput.text!)
    }
    
    @IBAction func changedTipAmount(_ sender: UIButton) {
        let buttons = [zeroPercent, tenPercent, twentyPercent]
        
        switch sender.currentTitle {
        case "0%":
//            percent = 0.00
            calcBrain.updatePercent(newPercent: 0.00)
            selectedButton = zeroPercent

        case "10%":
//            percent = 10.00
            calcBrain.updatePercent(newPercent: 10.00)
            selectedButton = tenPercent

        case "20%":
//            percent = 20.00
            calcBrain.updatePercent(newPercent: 20.00)
            selectedButton = twentyPercent
        default:
            print("Error")
        }
        
        for button in buttons {
            if selectedButton == button {
                button!.backgroundColor = UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0)
                button!.setTitleColor(UIColor.white, for: .normal)
            } else {
                button!.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
                button!.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
            }
        }
    }
    
    @IBAction func changeSplitAmount(_ sender: UIStepper) {
        splitAmountLabel.text = "\(Int(sender.value))"
//        splitAmount = Int(sender.value)
        calcBrain.updateSplit(newSplit: Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            print("Segue to ResultViewController")
            let destinationVC = segue.destination as! ResultViewController
//            destinationVC.cost = cost
//            destinationVC.percent = percent
//            destinationVC.splitAmount = splitAmount
            destinationVC.cost = calcBrain.cost
            destinationVC.percent = calcBrain.percent
            destinationVC.splitAmount = calcBrain.splitAmount
        } else {
            print("Unexpected segue identifier")
        }
    }
    
    func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        
        numberInput.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
}
