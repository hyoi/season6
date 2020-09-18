
//
//  File.swift
//  PoseFinder
//
//  Created by 渡邉輝 on 2020/09/15.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SocketIO


public protocol SocketData{}
    
//struct CustomData : SocketData {
//   let name: String
//   let age: Int
//
//   func socketRepresentation() -> SocketData {
//    return [name, age] as! SocketData
//   }
//}

    
    class name {
        
       
    
    
    let manager = SocketManager(socketURL: URL(string:"http://192.168.22.88:8080/")!, config: [.log(true), .compress])
    var socket : SocketIOClient!


    
    func sendData(poses:[Pose]){
         socket = manager.defaultSocket
         print("sendData")
//         socket.on(clientEvent: .connect){[weak self] data, ack in
//             print("socket connected!")
//            self?.socket.emit("from_client",CustomData(name: "Erik", age: 24))
//         }

         socket.on(clientEvent: .disconnect){data, ack in
             print("socket disconnected!")
         }

         socket.on("from_server"){data, ack in
             if let message = data as? [String]{
                 print(message[0])

             }
         }
         socket.connect()
        }


}
