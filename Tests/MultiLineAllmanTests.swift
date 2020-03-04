//
//  AllmanTests.swift
//  SwiftFormat
//
//  Created by Daniel Crampton on 2020-06-17.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import Foundation

@testable import SwiftFormat
import XCTest

class MultiLineAllmanTests: XCTestCase {
    func testInit() {
        let input = """

        init(
            a: Int,
            b: Int) {
            print(a); print(b)
        }
        """

        let output = """

        init(
            a: Int,
            b: Int)
        {
            print(a); print(b)
        }
        """

        RulesShared.testFormatting(
            for: input,
            output,
            rule: FormatRules.multiLineBraces,
            options: FormatOptions(closingParenOnSameLine: true),
            exclude: ["braces"]
        )
    }

    func testFunc() {
        let input = """

        func blah(
            a: Int,
            b: Int) {
            print(a); print(b)
        }
        """

        let output = """

        func blah(
            a: Int,
            b: Int)
        {
            print(a); print(b)
        }
        """

        RulesShared.testFormatting(
            for: input,
            output,
            rule: FormatRules.multiLineBraces,
            options: FormatOptions(closingParenOnSameLine: true),
            exclude: ["braces"]
        )
    }

    func testIf() {
        let input = """

        if true,
            false {
            print("wow")
        }
        """

        let output = """

        if true,
            false
        {
            print("wow")
        }
        """

        RulesShared.testFormatting(
            for: input,
            output,
            rule: FormatRules.multiLineBraces,
            options: FormatOptions(closingParenOnSameLine: true),
            exclude: ["braces"]
        )
    }

    func testIfLet() {
        let input = """

        if let a = b,
            let b = c {
            print("true")
        }
        """

        let output = """

        if let a = b,
            let b = c
        {
            print("true")
        }
        """

        RulesShared.testFormatting(
            for: input,
            output,
            rule: FormatRules.multiLineBraces,
            options: FormatOptions(closingParenOnSameLine: true),
            exclude: ["braces"]
        )
    }

    func testGuard() {
        let input = """

        guard let a = b,
            let b = c else {
            print("true")
        }
        """

        let output = """

        guard let a = b,
            let b = c else
        {
            print("true")
        }
        """

        RulesShared.testFormatting(
            for: input,
            output,
            rule: FormatRules.multiLineBraces,
            options: FormatOptions(closingParenOnSameLine: true),
            exclude: ["braces"]
        )
    }
}
