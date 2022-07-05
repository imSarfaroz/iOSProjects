//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.

import UIKit
import InputBarAccessoryView
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

struct Media: MediaItem{
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, InputBarAccessoryViewDelegate, MessageCellDelegate {
    
    //    func inputBar(_ inputBar: InputBarAccessoryView, didChangeIntrinsicContentTo size: CGSize) {
    //        <#code#>
    //    }
    //    func inputBar(_ inputBar: InputBarAccessoryView, textViewTextDidChangeTo text: String) {
    //        <#code#>
    //    }
    //    func inputBar(_ inputBar: InputBarAccessoryView, didSwipeTextViewWith gesture: UISwipeGestureRecognizer) {
    //        <#code#>
    //    }
    
    
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
        messages.append(Message(sender: currentUser, messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400), kind: .photo(Media(url:nil,
                                                                                                image:UIImage(named: "mountainImage"),
                                                                                                placeholderImage: UIImage(named: "mountainImage")!,
                                                                                                size: CGSize(width: 250, height: 200)))))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messageCellDelegate = self
        messageInputBar.delegate = self
        
    }
    
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text(text)))
        // print("you sent \(text)")
        messagesCollectionView.reloadData()
    }
    
    //    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
    //        return UIColor.green
    //    }
    //
    //    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
    //        return Message.messageID = "1" ? UIColor.white : UIColor.black
    //    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func didTapAvatar(in cell: MessageCollectionViewCell) {
        print("Avatar tapped")
    }
    
    func didTapMessage(in cell: MessageCollectionViewCell) {
        print("Message tapped")
        
        
    }
}

