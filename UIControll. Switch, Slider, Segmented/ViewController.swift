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
    
    lazy var sliderUI: UISlider = {
        $0.frame = CGRect(x: 30, y: 300, width: 200, height: 50)
        $0.minimumValue = 0
        $0.maximumValue = 100
        $0.isContinuous = true
        $0.addAction(sliderAction, for: .valueChanged)
        return $0
    }(UISlider())
    
    lazy var textLabel: UILabel = {
        $0.frame = CGRect(x: 30, y: 360, width: 200, height: 50)
        
        return $0
    }(UILabel())
    
    lazy var sliderAction: UIAction = UIAction { action in
        guard let sender = action.sender as? UISlider else { return }
        
        let step: Float = 20
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue        // «приклеиваем» бегунок
        print(Int(roundedValue))
    }
    
    lazy var segmentedControl: UISegmentedControl = {
        $0.frame = CGRect(x: 30, y: 430, width: 200, height: 50)
        $0.insertSegment(withTitle: "Option 1", at: 0, animated: false)
        $0.insertSegment(withTitle: "Option 2", at: 1, animated: false)
        $0.insertSegment(withTitle: "Option 3", at: 2, animated: false)
        $0.selectedSegmentIndex = 0
        return $0
    }(UISegmentedControl(frame: .zero, primaryAction: segmentedAction))
    
    lazy var segmentedAction: UIAction = UIAction { action in
        guard let sender = action.sender as? UISegmentedControl else { return }
        
        print(sender.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(btn)
        view.addSubview(switchVIew)
        view.addSubview(sliderUI)
        view.addSubview(textLabel)
        view.addSubview(segmentedControl)
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
