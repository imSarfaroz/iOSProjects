//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    
    var displayName: String
}

struct  Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let currentUser = Sender(senderId: "self", displayName: "Jane Cooper")
    let ortherUser = Sender(senderId: "other", displayName: "Me")
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: currentUser, messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400), kind: .text("Hi")))
        
        messages.append(Message(sender: ortherUser, messageId: "2",
                                sentDate: Date().addingTimeInterval(-86400), kind: .text("Hello")))
        
        messages.append(Message(sender: currentUser, messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400), kind: .text("Link?")))
        
        messages.append(Message(sender: ortherUser, messageId: "2",
                                sentDate: Date().addingTimeInterval(-86400), kind: .text("google.com")))
        
        messages.append(Message(sender: currentUser, messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400), kind: .text("thank!")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
//    func currentUsers() {
//        return currentUser
//    }
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}
