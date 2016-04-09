//
//  StringParser.swift
//  MarkdownToc
//
//  Created by 张星宇 on 16/4/9.
//  Copyright © 2016年 zxy. All rights reserved.
//

import Foundation

extension String {
    // 获取字符串开头有多少个连续的 #
    func getNumbeOfSharp() -> Int {
        var number = 0
        for c in self.characters {
            guard c == "#" else { break }
            number += 1
        }
        return number
    }
    
    // 过滤掉字符串开头所有的 # 和空格
    func filterSharpAndBlank() -> String {
        var idx = self.startIndex
        while idx != self.endIndex {
            guard self[idx] == "#" || self[idx] == " " else { break }
            idx = idx.successor()
        }
        
        return self.substringFromIndex(idx)
    }
    
    // 将字符串 a 转换成 * [a](mark) 这样的形式，用于填充 TOC 头部
    func addMark(mark: Int) -> String {
        return "* [" + self + "]" + "(#\(mark))"
    }
    
    // 如果已有 Toc，删除掉
    mutating func removeToc() -> String {
        if let range = self.rangeOfString(kTocEndSignal) {
            self = self.substringFromIndex(range.endIndex)  // 删除 toc 的头部
            let lines = self.characters.split(Int.max, allowEmptySlices: true) {$0 == "\n"}.map(String.init) // 分割成字符串数组
            let filteredLines = lines.filter { !$0.hasPrefix("<a name=") && !$0.hasSuffix("></a>") || $0 == "\n"} // 过滤掉锚点
            return filteredLines.reduce("", combine: {$0 + $1 + "\n"})
        }
        return self
    }
}

// 将 mark 转换成 <a name=mark></a>\n 这样的 HTML 代码，埋锚点
func addAnchor(mark: Int) -> String {
    return "\n<a name=\(mark)></a>\n"
}