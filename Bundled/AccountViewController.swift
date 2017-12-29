//
//  ViewController.swift
//  account
//
//  Created by si zhang on 17/4/9.
//  Copyright © 2017年 si zhang. All rights reserved.
//

import UIKit
import Firebase
class AccountViewController: UIViewController {
    //set up UI for background, user information, and button
     let BgImage: UIImageView = {
     let theImageView = UIImageView()
     theImageView.contentMode = .scaleAspectFill
     theImageView.image = UIImage(named: "bg.jpg")
     theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
     return theImageView
     }()
    var dietaryRestrictions: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.center = CGPoint(x: 160, y: 395)
        label.textAlignment = .center
        label.text = "Dietary Restrictions"
        return label
    }()
    var info: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.center = CGPoint(x: 160, y: 175)
        label.textAlignment = .center
        label.text = "Information"
        return label
    }()
    var userName: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.center = CGPoint(x: 160, y: 235)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "SiZhang"
        return label
    }()
    var email: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.center = CGPoint(x: 160, y: 280)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "sz117@duke.edu"
        return label
    }()
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scuba.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("Log Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    //button 1: morning
    lazy var PopMorningButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Breakfast", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        if morningFlag == -1 {
            button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
        if morningFlag == 1{
            button.backgroundColor = UIColor.clear
        }
        
        return button
    }()
    //button 2: lunch
    lazy var PopLunchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Lunch", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //  button.addTarget(self, action: #selector(LunchFunc), for: .touchUpInside)
        
        if lunchFlag == -1 {
            button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
        if lunchFlag == 1{
            button.backgroundColor = UIColor.clear
        }
        
        return button
    }()
    //button 3: dinner
    lazy var PopDinnerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Dinner", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(DinnerFunc), for: .touchUpInside)
        
        if dinnerFlag == -1 {
            button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
        if dinnerFlag == 1{
            button.backgroundColor = UIColor.clear
        }
        
        return button
    }()
    //button 4: vegetable
    lazy var PopVegetableButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("vegetarian", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(VegetableFunc), for: .touchUpInside)
        
        if vegetableFlag == -1 {
            button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
        if vegetableFlag == 1{
            button.backgroundColor = UIColor.clear
        }
        
        return button
    }()
    //button 5: low fat
    lazy var PopLowfatButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("low fat", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(LowfatFunc), for: .touchUpInside)
        
        if lowfatFlag == -1 {
            button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
        if lowfatFlag == 1{
            button.backgroundColor = UIColor.clear
        }
        
        return button
    }()
    //view didload
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        // view.addSubview(BgImage)
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(BgImage)
        view.addSubview(PopMorningButton)
        view.addSubview(PopLunchButton)
        view.addSubview(PopDinnerButton)
        view.addSubview(PopVegetableButton)
        view.addSubview(PopLowfatButton)
        view.addSubview(profileImageView)
        view.addSubview(dietaryRestrictions)
        view.addSubview(info)
        view.addSubview(userName)
        view.addSubview(email)
        view.addSubview(logOutButton)
        setupProfileImageView()
        setupMorningButton()
        setupLunchButton()
        setupDinnerButton()
        setupVegetableButton()
        setupLowfatButton()
        setUpOutButton()
        //check
        checkIfUserIsLoggedIn()
    }
    //this function is to check whether user is logged in
    func checkIfUserIsLoggedIn() {
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.userName.text = dictionary["name"] as? String
                    self.email.text = dictionary["email"] as? String
                }
            }, withCancel: nil)
        }
    }
    //thif function help log out
    func handleLogout() {
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
    //function for back to previous view
    func handleBack(){
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //set up constraints for all components
    func setupProfileImageView() {
        //need x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    //button 1: morning
    func setupMorningButton() {
        //need x, y, width, height constraints
        PopMorningButton.rightAnchor.constraint(equalTo: PopLunchButton.leftAnchor, constant: -15).isActive = true
        PopMorningButton.centerYAnchor.constraint(equalTo: PopVegetableButton.topAnchor, constant: -30).isActive = true
        PopMorningButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        PopMorningButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 2: lunch
    func setupLunchButton() {
        //need x, y, width, height constraints
        PopLunchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        PopLunchButton.centerYAnchor.constraint(equalTo: PopVegetableButton.topAnchor, constant: -30).isActive = true
        PopLunchButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        PopLunchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 3: dinner
    func setupDinnerButton() {
        //need x, y, width, height constraints
        PopDinnerButton.leftAnchor.constraint(equalTo: PopLunchButton.rightAnchor, constant: 15).isActive = true
        PopDinnerButton.centerYAnchor.constraint(equalTo: PopVegetableButton.topAnchor, constant: -30).isActive = true
        PopDinnerButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        PopDinnerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 4: vegetable
    func setupVegetableButton() {
        //need x, y, width, height constraints
        PopVegetableButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 80).isActive = true
        PopVegetableButton.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        PopVegetableButton.widthAnchor.constraint(equalToConstant: 85).isActive = true
        PopVegetableButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 5: low fat
    func setupLowfatButton() {
        //need x, y, width, height constraints
        PopLowfatButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50).isActive = true
        PopLowfatButton.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        PopLowfatButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        PopLowfatButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    func setUpOutButton() {
        //need x, y, width, height constraints
        logOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logOutButton.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -240).isActive = true
        logOutButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
