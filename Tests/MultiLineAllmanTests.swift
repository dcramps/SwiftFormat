//
//  AllmanTests.swift
//  SwiftFormat
//
//  Created by Daniel Crampton on 2020-06-17.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import Foundation

import XCTest
@testable import SwiftFormat

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

    func testIfDuplicateTokenReferences() {
        let input = """
        if formatter.options.fragment,
            let firstIndex = formatter.index(of: .nonSpaceOrLinebreak, after: -1),
            let indentToken = formatter.token(at: firstIndex - 1), case let .space(string) = indentToken {
            indentStack[0] = string
        }
        """

        let output = """
        if formatter.options.fragment,
            let firstIndex = formatter.index(of: .nonSpaceOrLinebreak, after: -1),
            let indentToken = formatter.token(at: firstIndex - 1), case let .space(string) = indentToken
        {
            indentStack[0] = string
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

    func testProperIndentation() {
        let input = """
        class TestClass {
            init(
                a: Int,
                b: Int) {
                print(a); print(b)
            }
        }
        """

        let output = """
        class TestClass {
            init(
                a: Int,
                b: Int)
            {
                print(a); print(b)
            }
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

    func testInlineClosure() {
        let input = """
        if let a = b.first(where: { $0.something }),
            let c = a.count {
            print(c)
        }
        """

        let output = """
        if let a = b.first(where: { $0.something }),
            let c = a.count
        {
            print(c)
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

    func testInlineClosureWithMultipleLines() {
        let input = """
        guard nil != [1, 2, 3].first(where: { int -> Bool in
            int > 1
        }) else {
            return
        }
        """

        RulesShared.testFormatting(
            for: input,
            rule: FormatRules.multiLineBraces,
            options: FormatOptions(closingParenOnSameLine: true),
            exclude: ["braces"]
        )
    }
}
