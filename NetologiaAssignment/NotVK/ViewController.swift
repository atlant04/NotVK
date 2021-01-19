//
//  ViewController.swift
//  NetologiaAssignment
//
//  Created by MacBook on 1/19/21.
//

import UIKit

class ViewController: UIViewController {

    //Кнопка для перехода на окно с лентой
    lazy var showFeedButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = .systemFont(ofSize: 24)
        btn.setTitle("Лента", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        return btn
    }()

    let notVKAPI = NotVKAPI()


    override func viewDidLoad() {
        super.viewDidLoad()
        //создаем вертикальный стэк
        let stack = UIStackView(arrangedSubviews: [showFeedButton])
        stack.axis = .vertical

        //Добавляем стэк в иерархию вьюхи контроллера
        self.view.addSubview(stack)

        //включаем AutoLayout
        self.view.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false

        //центрируем стэк. Размер не указываем, т.к. стэк сможет рассчитать размер самостоятельно, используя intrinsicContentSize кнопки

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        //Будем показвать экран ленты по нажатию на кнопку, пока прямо из контроллера
        self.showFeedButton.addTarget(self, action: #selector(showFeed), for: .touchUpInside)
    }

    //Система Target-Action завязана на рантайме Objective-C, поэтому маркируем метод как @objc
    @objc func showFeed() {
        //Создаем конроллер ленты, внедряем записимость по API, показываем модально
        let feedVC = FeedViewController()
        feedVC.serverWorker = notVKAPI
        show(feedVC, sender: self)
    }


}

