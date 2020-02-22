//
//  MinifyCSSPublishPlugin.swift
//
//
//  Created by Andy Regensky on 27.01.20.
//

import Publish
import Files
import Foundation

public extension Plugin {
    /// Minify the CSS file specified relative to the output folder.
    static func minifyCSS(at path: Path) throws -> Self {
        Plugin(name: "Minify CSS file") { context in
            let file = try context.outputFile(at: path)
            try minifyCSS(file)
        }
    }
    
    /// Minify all CSS files in the given folder relative to the output folder.
    static func minifyCSS(in path: Path = "") throws -> Self {
        Plugin(name: "Minify CSS files") { context in
            let cssFiles = try context.outputFolder(at: path)
                .files
                .filter({ $0.extension == "css" })
            
            try cssFiles.forEach(minifyCSS)
        }
    }
    
    private static func minifyCSS(_ file: File) throws {
        var css = try file.readAsString()
        css.removeCharacters(matching: \.isNewline)
        css.removeRepeatedCharacters(matching: \.isWhitespace)
        try file.write(css)
    }
}

private extension String {
    mutating func removeCharacters(matching keyPath: KeyPath<Character, Bool>) {
        self.removeAll { character -> Bool in
            character[keyPath: keyPath]
        }
    }
    
    mutating func removeRepeatedCharacters(matching keyPath: KeyPath<Character, Bool>) {
        guard !isEmpty else { return }
        var lastCharacter = self.first
        var index = self.index(after: startIndex)
        while index != self.endIndex {
            let character = self[index]
            if character[keyPath: keyPath] && character == lastCharacter {
                self.remove(at: index)
                continue
            }
            lastCharacter = character
            index = self.index(after: index)
        }
    }
}
