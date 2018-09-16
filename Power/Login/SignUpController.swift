//
//  SignUpController.swift
//  Power
//
//  Created by Chris Gonzaga on 8/24/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Firebase
import UIKit

class SignUpController: UIViewController, UINavigationControllerDelegate {
    
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "flow_logo_green"))
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }()
    

    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
//        tf.placeholder = "Username"
        tf.attributedPlaceholder = NSAttributedString(string: "Username",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    @objc func handleTextInputChange() {
        let isFormValid = emailTextField.text?.isEmpty == false && usernameTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        
        if isFormValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = .darkGreen
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .lightGreen
        }
    }
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        
        
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGreen
        
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    } ()
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if let err = error {
                print("Failed to create user:", err)
                return
            }
            
             print("Sucessfully saved user info to database")
            
            // a uid as key, and username as dictionaryValues
            guard let uid = user?.user.uid else { return }
            let dictionaryValues = ["username": username]
            
            let values = [uid: dictionaryValues]
            
            Database.database().reference().child("users").setValue(values, withCompletionBlock: { (err, ref) in
                
                if let err = err {
                    print("Failed to save user info into db:", err)
                    return
                }
                
                print("Successfully saved user info to db")
                
            })
            
        
            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
            mainTabBarController.setupViewControllers()
            self.dismiss(animated: true, completion: nil)
        }
       
    }
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ",attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: "Sign In",attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor: UIColor.green])) // same color as log in
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleAlreadyHaveAccount), for: .touchUpInside)
        return button
    }()
    
    @objc func handleAlreadyHaveAccount() {
        _ = navigationController?.popViewController(animated: true) // return a VC where you pressed first. the top view(2nd one is popped off). we also let it know we're using VC with _ =
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        self.view.clipsToBounds = true
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "signUp2.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        view.backgroundColor = .white
    
        
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        setupInputFields()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    
    @objc func keyboardWillShow() {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0 // Move view to original position
    }

    
    
    
    
    
    
    
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        
        
        
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: logoImageView.bottomAnchor, left: logoImageView.leftAnchor, bottom: nil, right: logoImageView.rightAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 0)
        
        
       
    }
    
    

    
    override func viewDidLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    

    
 
}
