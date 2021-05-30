//
//  ViewController.swift
//  Animation
//
//  Created by Artem  on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var button: UIButton = {
        let button = UIButton()
        button.setTitle("Animation", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let shapeLayer = CAShapeLayer()
    
    var pulsatingLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackLayer = CAShapeLayer()
        
        let circul = UIBezierPath(arcCenter: .zero, radius: 150, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circul.cgPath
        pulsatingLayer.strokeColor = UIColor.green.cgColor
        pulsatingLayer.lineWidth = 15
        pulsatingLayer.fillColor = UIColor.white.cgColor
        pulsatingLayer.lineCap = .round
        pulsatingLayer.position = view.center
        
        trackLayer.path = circul.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.white.cgColor
        trackLayer.lineCap = .round
        trackLayer.position = view.center
        
        shapeLayer.path = circul.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.position = view.center
        
        view.layer.addSublayer(pulsatingLayer)
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        view.addSubview(button)
        setupConstraint()
        view.backgroundColor = .white
        
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            button.widthAnchor.constraint(equalToConstant: 100)
        
        ])
    }
    
    func loadingAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.toValue = 1
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        shapeLayer.add(animation, forKey: "strokeEnd")
    }
    
    func animatePulsating() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.toValue = 1.2
        animation.duration = 0.8
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.repeatCount = Float(CGFloat.infinity)
        
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
    
    @objc func buttonTapped() {
        loadingAnimation()
        animatePulsating()
    }
}

