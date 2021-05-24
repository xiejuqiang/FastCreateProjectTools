//
//  FastCreateProWidget.swift
//  FastCreateProWidget
//
//  Created by xiejuqiang on 2020/9/25.
//  Copyright © 2020 juqiangxie. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate)

        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct FastCreateProWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .center, spacing: 3){
            Link(destination: URL(string: "alipay://platformapi/startapp?appId=20000056")!, label: {
                Text("支付宝扫一扫")
            })
            Link(destination: URL(string: "weixin://scanqrcode")!, label: {
                Text("微信扫一扫")
            })
            Link(destination: URL(string: "https://www.apple.com")!, label: {
                Text("每日一言")
            })
                
        }
        
        
            
            
        }
       
        
    
}

@main
struct FastCreateProWidget: Widget {
    let kind: String = "FastCreateProWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            FastCreateProWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct FastCreateProWidget_Previews: PreviewProvider {
    static var previews: some View {
        FastCreateProWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            
        
        FastCreateProWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            
        FastCreateProWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            
    }
}
