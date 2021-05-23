//
//  ViewController.swift
//  ShareButton
//
//  Created by Artem  on 23.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let shareButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        button.setTitle("Share", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let activityViewController: UIActivityViewController = {
        let customItem = UICustomActivity(title: "Custom Activity") { sharedItems in
            guard let sharedStrings = sharedItems as? [String] else { return }

            for string in sharedStrings {
                print("Here's the string: \(string)")
            }
        }
        let text = ["Some text"]
        let activityViewController = UIActivityViewController(activityItems: text, applicationActivities: [customItem])
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.saveToCameraRoll]
        //activityViewController
        return activityViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(shareButton)
        activityViewController.popoverPresentationController?.sourceView = view
        setupConstraints()
    }
    
    @objc func buttonTapped() {
        present(activityViewController, animated: true, completion: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}

