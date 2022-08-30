//
//  ContentView.swift
//  listApp WatchKit Extension
//
//  Created by Jaqueline Oliveira on 29/08/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var data: [Reminder] = [
        Reminder(name: "Map",
                 content: "O map faz um loop sobre uma coleção e aplica a mesma operação a cada elemento",
                 image: ""),
        Reminder(name: "Reduce",
                 content: "Combina todos os itens de uma coleção para criar um único valor.",
                 image: ""),
    ]
    
    @State var columns: [GridItem] = [
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHGrid(rows: columns, spacing: 20) {
                    ForEach(data.indices) { index in
                        VStack {
                            ScrollView(.vertical) {
                                HStack {
                                    Text(data[index].name)
                                        .padding(.leading, 5)
                                        .frame(maxWidth: .infinity, maxHeight: 20)
                                    AsyncImage(url: URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png")) { image in
                                        
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 60, height: 20)
                                    .padding(.trailing, 20)
                                }.padding(.top, 10)
                                HStack {
                                    Text(data[index].content)
                                        .padding(10)
                                        .font(.system(size: 12))
                                }
                                HStack {
                                    Text(data[index].content)
                                        .padding(10)
                                        .font(.system(size: 12))
                                }
                                HStack {
                                    Text(data[index].content)
                                        .padding(10)
                                        .font(.system(size: 12))
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height - 40, alignment: .topLeading)
                            .background(Color.purple)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Reminder: Identifiable {
    
    var id = UUID().uuidString
    
    let name: String
    let content: String
    let image: String
    
    init(name: String, content: String, image: String) {
        
        self.name = name
        self.content = content
        self.image = image
    }
}
