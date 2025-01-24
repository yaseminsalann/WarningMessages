//
//  ViewController.swift
//  WarningMessages
//
//  Created by Yasemin salan on 20.01.2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordSecondText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singUpButton(_ sender: Any) {
        if usernameTextField.text == "" {
            showAlert(title: "Hata", message: "Kullanıcı adı Boş Bırakılamaz!", buttonTitle: "Tamam")
        }
        else if(passwordTextField.text == ""){
            showAlert(title: "Hata", message: "Şifre Boş Bırakılamaz!", buttonTitle: "Tamam")
        }
        else if(passwordSecondText.text != passwordTextField.text){
            showAlert(title: "Hata", message: "Şifreler Eşleşmedi!", buttonTitle: "Tamam")
        }
        else{
            showAlert(title: "Başarılı", message: "Kullanıcı Başarılı Bir Şekilde Kayıt edildi.", buttonTitle: "Tamam")
        }
    }
    
    func showAlert(title: String, message: String,buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //UIAlertAction içindeki title butonun ismidir, style butonun türüdür cancel,default,destructive olarak türleri vardır, handler ise alert gösterildikten sonra birşey yapılmak istenirse buraya tanımlanır nil yada boş bırakılırsa birşey yapılmaz.
        /*let okButton = UIAlertAction(title:buttonTitle, style: UIAlertAction.Style.default){(UIAlertAction) in
            //eğer butona basılınca bir işlem yapılmıyorsa bu bloğa gerek yok nil yapılır.
            print("butona tıklandı")
        }*/
        let okButton = UIAlertAction(title:buttonTitle, style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        //bir görünümü göstermek için present kullanılır.
        self.present(alert, animated: true, completion: nil)
    
    }
}

