// Created by Gayan Dias on 10/09/2022.

import Foundation

extension String {
    func htmlToString() -> String {
        return  try! NSAttributedString(data: self.data(using: .utf8)!,
                                        options: [.documentType: NSAttributedString.DocumentType.html],
                                        documentAttributes: nil).string
    }
}

func valueForAPIKey(_ keyname:String) -> String {
    let bundle = Bundle.main
    let KeyFileName = bundle.object(forInfoDictionaryKey: "KeyFileName") as? String
    let path = bundle.path(forResource: KeyFileName, ofType: "plist")
    let plist = NSDictionary(contentsOfFile: path!)
    let value = plist!.object(forKey: keyname) as? String
    return value!
}
