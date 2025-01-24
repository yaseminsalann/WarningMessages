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
    
    
    @IBAction func actionSheetButton(_ sender: Any) {
        showActionSheet()
    }
    
    @IBAction func alertWithTextField(_ sender: Any) {
        showAlertWithTextField()
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
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Bilgilerini Paylaşmak İstermisin?",
                                            message: "Bir seçim yapınız",
                                            preferredStyle: .actionSheet)
        
        // Eylemler ekleme
        let option1 = UIAlertAction(title: "Mesajla paylaş",
                                    style: .default) { _ in
            print("Mesajla paylaş seçeneği seçildi")
        }
        let option2 = UIAlertAction(title: "E-posta ile paylaş",
                                    style: .default) { _ in
            print("E-posta ile paylaş seçeneği seçildi")
        }
        let option3 = UIAlertAction(title: "Sosyal medyada paylaş",
                                    style: .default) { _ in
            print("Sosyal medyada paylaş seçeneği seçildi")
        }
        let cancelAction = UIAlertAction(title: "İptal",
                                         style: .cancel,
                                         handler: nil)
        
        actionSheet.addAction(option1)
        actionSheet.addAction(option2)
        actionSheet.addAction(option3)
        actionSheet.addAction(cancelAction)
        
        // Action Sheet'i gösterme
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(actionSheet, animated: true, completion: nil)
        }
    }
    func showAlertWithTextField() {
        let alert = UIAlertController(title: "Giriş Yap",
                                      message: "Lütfen adınızı girin",
                                      preferredStyle: .alert)
        
        // Metin alanı ekleme
        alert.addTextField { textField in
            textField.placeholder = "Adınız"
        }
        
        // Eylemler ekleme
        let submitAction = UIAlertAction(title: "Gönder",
                                         style: .default) { _ in
            if let textField = alert.textFields?.first {
                print("Girilen isim: \(textField.text ?? "")")
                self.usernameTextField.text = textField.text
            }
        }
        let cancelAction = UIAlertAction(title: "İptal",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        // Alert'i gösterme
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alert, animated: true, completion: nil)
        }
    }


}

