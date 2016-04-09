//
//  main.swift
//  MarkdownToc
//
//  Created by 张星宇 on 16/4/9.
//  Copyright © 2016年 zxy. All rights reserved.
//

import Foundation

let filePath = Process.arguments[1]
var mark = 0 // 用来标记锚点，每次递增
let rootToc = Toc() // 根 toc 节点

do {
    var contents = try String(contentsOfFile: filePath)
    contents = contents.removeToc()
    
    let lines = contents.characters.split{$0 == "\n"}.map(String.init)
    contents = ""
    
    for line in lines {
        let level = line.getNumbeOfSharp()
        if level > 0 {
            rootToc.addToc(line.filterSharpAndBlank().addMark(mark), level: level) // 填充 TOC
            contents += (addAnchor(mark) + line + "\n") // 埋锚点
            mark += 1 // 更新 mark
        }
        else {
            contents += (line + "\n")
        }
    }
    
    do {
        contents = String(rootToc) + contents
        try contents.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        print("You have successfully add toc to your markdown file!")
    } catch {
        print("something is wrong, Failed to Write into file at path:\(filePath)")
    }
} catch {
    print("Cannot read file or file doesn't exist at path:\(filePath)")
}

// 测试
//Toc().runtest()


