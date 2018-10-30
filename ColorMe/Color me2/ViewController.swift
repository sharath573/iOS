import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var redText: UITextField!
    @IBOutlet weak var greenText: UITextField!
    @IBOutlet weak var blueText: UITextField!
    @IBOutlet weak var colorView: UIView!
    var location = CGPoint(x: 0, y: 0)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        redText.text = "0" ; greenText.text = "0" ; blueText.text = "0"
        self.colorView.backgroundColor = UIColor.black //black screen initial
        redText.delegate = self ; greenText.delegate = self ; blueText.delegate = self

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func ColorButton(_ sender: Any) {
        self.view.endEditing(true)   //removing keyboard
        UserDefaults.standard.set(redText.text, forKey: "redvalue")
        UserDefaults.standard.set(greenText.text, forKey: "greenvalue")
        UserDefaults.standard.set(blueText.text, forKey: "bluevalue")
        colorUpdate()
    }
    @IBAction func redSlider(_ sender: UISlider) {
         redText.text = String(Int(sender.value))
         UserDefaults.standard.set(redText.text, forKey: "redvalue")
         colorUpdate()
    }
    @IBAction func greenSlider(_ sender: UISlider){
        greenText.text = String(Int(sender.value))
        UserDefaults.standard.set(greenText.text, forKey: "greenvalue")
        colorUpdate()
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        blueText.text = String(Int(sender.value))
         UserDefaults.standard.set(blueText.text, forKey: "bluevalue")
        colorUpdate()
    }
    ///////alertfunction
    func setAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "I Understand", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion : nil)
        }))
        self.present(alert, animated:true, completion:nil)
    }
    func colorUpdate()
    {
        let redTextInt :Int? =  Int(redText.text!) ; let redTextfloat = CGFloat(redTextInt!)
        let greenTextInt :Int? = Int(greenText.text!) ; let greenTextfloat = CGFloat(greenTextInt!)
        let blueTextInt :Int? = Int(blueText.text!) ; let blueTextfloat = CGFloat(blueTextInt!)
        let redTextIntvalue :Int = Int(redTextInt!) //changing Int? to Int for comparision
        let greenTextIntvalue :Int = Int(greenTextInt!)
        let blueTextIntvalue :Int = Int(blueTextInt!)
        
        if  redTextIntvalue > 100 || redTextIntvalue < 0 {
            setAlert(title: "Oops!", message: "Red Color value should be from 1 to 100.")
        } else if  greenTextIntvalue > 100 || greenTextIntvalue < 0 {
            setAlert(title: "Oops!", message: "Green Color value should be from 1 to 100.")
        } else if  blueTextIntvalue > 100 || blueTextIntvalue < 0 {
            setAlert(title: "Oops!", message: "BLue Color value should be from 1 to 100.")
        }else{
            colorView.backgroundColor = UIColor(red: CGFloat(redTextfloat)/100, green: CGFloat(greenTextfloat)/100, blue: CGFloat(blueTextfloat)/100, alpha: 1.0)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
       if let r = UserDefaults.standard.object(forKey: "redvalue") as? String
        { redText.text = r }
       if let g = UserDefaults.standard.object(forKey: "greenvalue") as? String
        { greenText.text = g }
       if let b = UserDefaults.standard.object(forKey: "bluevalue") as? String
        { blueText.text = b }
        colorUpdate()
    }
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?){
        let touch: UITouch! = touches.first
        location = touch.location(in: self.view)
        colorView.center = location
    }
    override func touchesMoved(_ touches:Set<UITouch>, with event :UIEvent!){
        let touch: UITouch! = touches.first
        location = touch.location(in: self.view)
        colorView.center = location
    }

}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
        textField.resignFirstResponder()
        return true
    }
}
