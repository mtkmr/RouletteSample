//
//  SettingViewController.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/11.
//

import UIKit

final class SettingViewController: UIViewController {
    
    private lazy var textField1: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField2: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField3: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField4: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField5: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField6: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField7: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField8: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    private lazy var textField9: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()

    private lazy var textField10: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        return field
    }()
    
    private lazy var textFields: [UITextField] = [
        textField1,
        textField2,
        textField3,
        textField4,
        textField5,
        textField6,
        textField7,
        textField8,
        textField9,
        textField10
    ]
    
    private lazy var setButton: UIButton = {
        let button = UIButton()
        button.setTitle("セット", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapSetButton(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapSetButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            var data: [String] = []
            data = self.textFields.map {
                $0.text!
            }
            Router.shared.showRoulette(from: self, data: data)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewsLayout()
    }
}

private extension SettingViewController {
    private func setupViewsLayout() {
        let vStackView = UIStackView(arrangedSubviews: textFields)
        vStackView.axis = .vertical
        vStackView.alignment = .fill
        vStackView.distribution = .fillEqually
        vStackView.spacing = 8
        view.addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                vStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                vStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                vStackView.heightAnchor.constraint(equalToConstant: 500)
            ]
        )
        view.addSubview(setButton)
        setButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                setButton.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 16),
                setButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                setButton.heightAnchor.constraint(equalToConstant: 60),
                setButton.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
}
