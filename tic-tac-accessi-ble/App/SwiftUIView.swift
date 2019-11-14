//
//  SwiftUIView.swift
//  Jogo da Velha
//
//  Created by Fred on 11/5/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text("Data de nascimento")
            Button(action: {}) { Text("Alterar") }
        }).accessibility(addTraits: .isButton)
          .accessibility(label: Text("Alterar data de Nascimento"))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
