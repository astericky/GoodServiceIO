//
//  ImageTest.swift
//  GoodService
//
//  Created by Chris Sanders on 9/2/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct ImageTest: View {
    var body: some View {
        VStack {
            Image("subway")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60, alignment: .center)
            Text("Subways")
        }
    }
}

struct ImageTest_Previews: PreviewProvider {
    static var previews: some View {
        ImageTest()
    }
}
