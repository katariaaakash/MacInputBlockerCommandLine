//
//  main.swift
//  InputBlocker
//
//  Created by Aakash Kataria on 20/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Foundation

print(ConfigConstants.startingLabel)
print(ConfigConstants.keyphraseEnterPromptText)

var keyPhrase: String!
var reKeyPhrase: String!

while(true){
    keyPhrase = String(cString: getpass("Please set up your passphrase: "))
    reKeyPhrase = String(cString: getpass("Please re enter your passphrase: "))
    if keyPhrase == reKeyPhrase {
        break;
    }
    print("Keyphrases does not match, Kindly re-enter \n")
}

print(ConfigConstants.passPhraseSetLabel)

ScreenTimeOutManager.sharedScreenTimeOutManager.setUpScreenTimeOutManager()
var inputBlocker:InputBlocker = InputBlocker(passPhrase: keyPhrase ?? ConfigConstants.defaultPassphrase)
inputBlocker.startBlocking()
