//
//  ViewController.swift
//  DemoProject3
//
//  Created by Revonomics on 16/10/18.
//  Copyright © 2018 Revonomics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewMainCircle: DesignableUIView!
    @IBOutlet weak var OnOffSegment: UISegmentedControl!
    @IBOutlet weak var sliderController: UISlider!
    @IBOutlet weak var lblCurrentSpeed: UILabel!
    
    var timer:Timer? = nil
    var intervalTime = 30.0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewMainCircle.layer.cornerRadius = viewMainCircle.bounds.size.height/2
        
        OnOffSegment.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        showMemoryAlert()
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        print("Speed Changed : ",Double(sender.value))
        lblCurrentSpeed.text = "Current : \(sender.value)"
        viewMainCircle.updateSpeed(speed: Double(sender.value))
    }
    
    @IBAction func OnOffSegmentAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("Stop Spinning..")
            stopSpinning()
        } else {
            print("Start Spinning..")
            startSpinning()
        }
    }
    
    func startSpinning()
    {
        viewMainCircle.rotate(duration: 10.0)
//        if timer != nil {
//            timer = nil
//        }
//
//        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    
    func stopSpinning() {
        viewMainCircle.stopRotating()
//        timer?.invalidate()
    }
    
    @objc func update() {
        print("Spinning....")
        UIView.animate(withDuration: intervalTime, animations: {
            for _ in 1...40 {
                //self.viewMainCircle.transform = self.view.transform.rotated(by: (90 * .pi)/180)
                self.viewMainCircle.transform = self.view.transform.rotated(by: (180 * .pi)/180)
                //self.viewMainCircle.transform = self.view.transform.rotated(by: (270 * .pi)/180)
                self.viewMainCircle.transform = self.view.transform.rotated(by: (360 * .pi)/180)
            }
        })
    }
    
    func showMemoryAlert() {
        let alert = UIAlertController.init(title: "Your Device Is Low On Memory", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { (_ action:UIAlertAction) in
            print("Ok Button Clicked")
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
}
