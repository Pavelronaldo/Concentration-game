//
//  ViewController.swift
//  Concentration
//
//  Created by Pavel Ronaldo on 4/11/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration =
        Concentration(numberOfPairsOfCards: numberOFPairsOfCards)
    
    var numberOFPairsOfCards: Int {
        return (сardButtons.count+1) / 2
        
    }
    
    private(set) var flipCount = 0 {
        
        didSet {
            updateFlipCountLabel()
        }
        
    }
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key:Any ] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var сardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = сardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromMOdel()
        } else {
            print ("Chosen card was not in card button")
        }
        
    }
    
    private  func updateViewFromMOdel() {
        for index in сardButtons.indices {
            let button = сardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    //    private var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"
    
    
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex ))
            
        }
        
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

