//
//  ItemDetail.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 6/5/24.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: Response
    var body: some View {
        Text(item.name)
        Text(item.course_code)
        Text(item.default_view)
        Text(item.myId)
    }
}

#Preview {
    ItemDetail(item: Response(
        name: "defaultClass",
        course_code: "mandel-123",
        id: 12345,
        enrollment_term_id: 1234,
        default_view: "modules"))
}
