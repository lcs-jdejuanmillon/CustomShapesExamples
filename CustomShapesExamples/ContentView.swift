//
//  ContentView.swift
//  CustomShapesExamples
//
//  Created by Jacobo de Juan Millon on 2022-11-17.
//

import SwiftUI

struct Diagonal: Shape {
    func path(in rect: CGRect) -> Path {
        
        // The path that describes the shape!
        var path = Path()
        
        // Here is where we'd describe the shape...
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Send back (return) the path that describes the shape
        return path
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Here is where we'd describe the shape...
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 0))
        // Send back (return) the path that describes the shape
        return path
    }
}

struct WeirdShapeThing: Shape {
    var sectionsDivided: Int
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in 1..<sectionsDivided {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: Double(i) * rect.maxY / Double(sectionsDivided)))
        }
        for i in 1..<sectionsDivided {
            path.move(to: CGPoint(x: rect.maxX, y: 0))
            path.addLine(to: CGPoint(x: Double(i) * rect.maxX / Double(sectionsDivided), y: rect.maxY))
        }
        for i in 1..<sectionsDivided {
            path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: 0, y: Double(i) * rect.maxY / Double(sectionsDivided)))
        }
        for i in 1..<sectionsDivided {
            path.move(to: CGPoint(x: 0, y: rect.maxY))
            path.addLine(to: CGPoint(x: Double(i) * rect.maxX / Double(sectionsDivided), y: 0))
        }
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Diamond()
            .stroke()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
