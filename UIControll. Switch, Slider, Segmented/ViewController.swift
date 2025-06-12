//
//  ViewController.swift
//  UIControll. Switch, Slider, Segmented
//
//  Created by Авазбек Надырбек уулу on 12.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var btn = CustomButton(frame: CGRect(x: 30, y: 100, width: 200, height: 200), image: UIImage(systemName: "plus")!, action: actionBtn)
    lazy var actionBtn: UIAction = UIAction { _ in
        print("Button is pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(btn)
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

