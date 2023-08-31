//
//  ThemeView.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 30.08.2023.
//

import UIKit

protocol ThemeViewDelegate: AnyObject {
    func updateColor()
}

final class ThemeView: UIView {
    
    weak var delegate: ThemeViewDelegate?
    
private var button1: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = OrangeTheme().backgroundColor
        return button
    }()


private var button2: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = YellowTheme().backgroundColor
        return button
}()
 
private var button3: UIButton = {
    let button = UIButton()
    button.layer.borderColor = UIColor.blue.cgColor
    button.layer.borderWidth = 1
    button.backgroundColor = GrayTheme().backgroundColor
    return button
}()

init() {
    super.init(frame: .zero)
    backgroundColor = Theme.currentTheme.backgroundColor
    button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
    button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
    button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
    setupViews()
}

required init? (coder: NSCoder) {
    fatalError("init(coder:) has not been impemented")
}

private func setupViews() {
    addSubview(button1)
    addSubview(button2)
    addSubview(button3)
    setupConstraints()
}

private func setupConstraints() {
    button1.translatesAutoresizingMaskIntoConstraints = false
    button2.translatesAutoresizingMaskIntoConstraints = false
    button3.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        button2.centerYAnchor.constraint(equalTo: centerYAnchor),
        button2.centerXAnchor.constraint(equalTo: centerXAnchor),
        button2.leadingAnchor.constraint(equalTo: leadingAnchor),
        button2.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -30),
        button1.centerXAnchor.constraint(equalTo: centerXAnchor),
        button1.leadingAnchor.constraint(equalTo: leadingAnchor),
        button1.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30),
        button3.centerXAnchor.constraint(equalTo: centerXAnchor),
        button3.leadingAnchor.constraint(equalTo: leadingAnchor),
        button3.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
    }
}

private extension ThemeView {
    
    @objc func tap1(){
        Theme.currentTheme = OrangeTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
    //ThemeSaver.putData()
    }
    
    @objc func tap2(){
        Theme.currentTheme = YellowTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
     //   ThemeSaver.putData()
    }
    
    @objc func tap3(){
        Theme.currentTheme = GrayTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
    //    ThemeSaver.putData()
    }
    
}
