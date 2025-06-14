//
//  ViewController.swift
//  UIControll. Switch, Slider, Segmented
//
//  Created by Авазбек Надырбек уулу on 12.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var btn = CustomButton(frame: CGRect(x: 30, y: 100, width: 200, height: 200), image: UIImage(systemName: "plus")!, action: actionBtn)
    
    lazy var actionBtn: UIAction = UIAction { action in
        print("Button is pressed ny \(action.sender)")
    }
    
    lazy var switchVIew: UISwitch = {
        $0.frame.origin = CGPoint(x: 30, y: 100)
        $0.onTintColor = .black
        $0.addAction(actionBtn, for: .valueChanged)
        return $0
    }(UISwitch())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(btn)
        view.addSubview(switchVIew)
    }
}

class CustomButton: UIControl {
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.frame.origin = .zero
        $0.frame.size = frame.size
       return $0
    }(UIImageView())
    
    init(frame: CGRect,image: UIImage, action: UIAction) {
        super.init(frame: frame)
        self.imageView.image = image
        addAction(action, for: .touchUpInside)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

