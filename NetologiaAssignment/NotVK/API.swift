//
//  API.swift
//  NetologiaAssignment
//
//  Created by MacBook on 1/19/21.
//

import Foundation

//протокол для ленты
protocol NotVKFeedAPIProtocol {
    func loadFeed(_ completion: @escaping (Result<[Post], Error>) -> Void)
}

final class NotVKAPI {
    //Создаем очередь на которой потом будем делать запросы, опционально
    private let requestQueue = DispatchQueue(label: "com.NOTVK.request", qos: .userInitiated)
}

//конформим к протоколу ленты
extension NotVKAPI: NotVKFeedAPIProtocol {
    func loadFeed(_ completion: @escaping (Result<[Post], Error>) -> Void) {
        requestQueue.async {
            sleep(1)
            let posts = (0...10).map {
                Post(avatarURL: URL(string: "https://picsum.photos/200")!,
                     username: "\($0)",
                     text: "Это я пишу пост!")
            }
            DispatchQueue.main.async {
                completion(.success(posts))
            }
        }
    }


}
