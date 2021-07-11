//
//  RouletteViewController.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/10.
//

import UIKit
import Charts

final class RouletteViewController: UIViewController, ChartViewDelegate {
    
    private let pieChartManager = PieChartManager()
    
    private var spinFlg: Bool = false //停止中
    
    private var randomAngle: Int = 0
    
    var data: [String] = []
    
    private lazy var pieChartView: PieChartView = {
        let view = PieChartView()
        view.delegate = self
        return view
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow"))
        imageView.backgroundColor = .clear
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var startStopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(didTapStartStopButton(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapStartStopButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            if !self.spinFlg {
                //停止→開始
                self.spinFlg.toggle()
                self.randomAngle = Int.random(in: 1...359) //update randomAngle
                self.pieChartView.spin(
                    duration: 60,
                    fromAngle: 270,
                    toAngle: CGFloat(self.randomAngle) + 36500,
                    easingOption: .linear
                )
                //button UI
                self.startStopButton.backgroundColor = .systemBlue
                self.startStopButton.setTitle("Stop", for: .normal)
            } else {
                //開始→停止
                self.spinFlg.toggle()
                self.pieChartView.spin(
                    duration: 2.0,
                    fromAngle: 270,
                    toAngle: 270 + 360 + CGFloat(self.randomAngle),
                    easingOption: .linear
                )
                //button UI
                self.startStopButton.backgroundColor = .systemRed
                self.startStopButton.setTitle("Start", for: .normal)
                
                //SHOW RESULT
                let selectedIndex = self.pieChartManager.getSelectedIndex(dataCount: self.data.count, randomAngle: self.randomAngle)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    Alert.okAlert(title: self.data[selectedIndex], message: "", on: self)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //Layout
        setupViewsLayout()
        //Pie Chartの設定
        pieChartManager.setup(pieChartView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pieChartManager.setData(pieChartView, data: data)
    }
}

private extension RouletteViewController {
    private func setupViewsLayout() {
        //Pie chart
        view.addSubview(pieChartView)
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                pieChartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                pieChartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                pieChartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                pieChartView.heightAnchor.constraint(equalToConstant: 300)
            ]
        )
        
        //arrow image
        view.addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                arrowImageView.topAnchor.constraint(equalTo: pieChartView.topAnchor),
                arrowImageView.centerXAnchor.constraint(equalTo: pieChartView.centerXAnchor),
                arrowImageView.widthAnchor.constraint(equalToConstant: 50),
                arrowImageView.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
        
        //startStopButton
        view.addSubview(startStopButton)
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                startStopButton.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: 40),
                startStopButton.heightAnchor.constraint(equalToConstant: 60),
                startStopButton.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
}
