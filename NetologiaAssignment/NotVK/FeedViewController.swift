//
//  FeedViewController.swift
//  NetologiaAssignment
//
//  Created by MacBook on 1/19/21.
//

import UIKit

//Создадим конроллер без сторибордов, полностью программно 
final class FeedViewController: UITableViewController {
    private let reuseID = "cell"
    var posts = [Post]()
    var serverWorker: NotVKFeedAPIProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем nib в контроллере таблицы
        let nib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: reuseID)

        //Имитируем запрос на сервер и перезагружаем таблицу
        serverWorker.loadFeed { [weak self] result in
            do {
                self?.posts = try result.get()
                self?.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    //Стандартные методы делегата и датасорса таблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! FeedTableViewCell
        cell.configure(with: posts[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}
