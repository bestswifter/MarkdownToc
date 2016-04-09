//
//  File.swift
//  MarkdownToc
//
//  Created by 张星宇 on 16/4/9.
//  Copyright © 2016年 zxy. All rights reserved.
//

import Foundation

let kTocBeginSignal = "<!--begin toc-->\n\n"
public let kTocEndSignal = "\n<!--end toc-->\n\n"

class Toc {
    private var parentToc: Toc? = nil
    private var childNodes: [Toc] = []
    private var toAddTocIndex: Int = 0 // 下一个 toc 节点从第几个子节点开始加
    private let level: Int
    
    let content: String
    
    private init(content: String, level: Int, parent: Toc? = nil) {
        self.content = content
        self.parentToc = parent
        self.level = level
    }
    
    convenience init() {
        self.init(content: "", level: 0)
    }
}

typealias TocAdd = Toc
extension TocAdd {
    // 每个节点都有可能调用这个方法，添加一个新的 toc 节点
    func addToc(content: String, level: Int) {
        if self.childNodes.isEmpty { // 空的根节点
            self.createTocInner(content, level: level)
        }
        else {
            if self.childNodes[toAddTocIndex].level < level { // 按顺序往下添加，递归
                self.childNodes[toAddTocIndex].addToc(content, level: level)
            }
            // 和自己的子节点平级，添加到自己后面
            else if self.childNodes[toAddTocIndex].level == level {
                self.createTocInner(content, level: level)
                self.toAddTocIndex += 1
            }
            else {
                self.parentToc?.createTocInner(content, level: level)
                self.parentToc?.toAddTocIndex += 1
            }
        }
    }
    
    // 某个 toc 节点添加自己的子节点
    private func createTocInner(content: String, level: Int) -> Toc{
        let childToc = Toc(content: content, level: level, parent: self)
        childNodes.append(childToc)
        return childToc
    }
}

typealias TocDebug = Toc
extension TocDebug : CustomStringConvertible {
    var description: String {
        return kTocBeginSignal + self.showStructureInner() + kTocEndSignal
    }
    
    private func showStructureInner(depth: Int = 0) -> String {
        var result = ""
        for child in childNodes {
            let blankArray = Array<String>(count: depth * 4, repeatedValue: " ") // 计算缩进
            let blankString = blankArray.reduce("", combine: {$0 + $1})

            result += "\(blankString + child.content)\n"  // 当前这一行
            result += child.showStructureInner(depth + 1) // 递归调用
            
        }
        return result
    }
    
    // 用来对 Toc 结构体的各种代码进行测试，平时不要调用
    func runtest() {
        self.addToc("11", level: 1)
        self.addToc("21", level: 2)
        self.addToc("22", level: 2)
        self.addToc("23", level: 2)
        self.addToc("31", level: 3)
        self.addToc("24", level: 2)
        self.addToc("12", level: 1)
        self.addToc("31", level: 3)
        self.addToc("51", level: 5)
        self.addToc("32", level: 3)
        self.addToc("13", level: 1)
        print(self)
    }
}

