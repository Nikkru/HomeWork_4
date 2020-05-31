//
//  DemotivatorViewController.swift
//  HomeWork_4
//
//  Created by Nikolai Krusser on 31.05.2020.
//  Copyright © 2020 Nikolai Krusser. All rights reserved.
//

import UIKit

class DemotivatorViewController: UIViewController {

    let text = "Наконец, я начал думать, то есть усиленно прислушиваться. Маловероятно, что меня здесь найдут, я обрел покой до тех пор, пока смогу его выдержать. На протяжении мгновения я обдумывал вопрос о том, чтобы здесь поселиться, обрести свое логово, убежище, на протяжении целого мгновения. После чего вынул из кармана овощной нож и приступил к вскрытию вен на запястье. Но боль быстро победила. Сначала я закричал, потом сдался, закрыл нож и сунул его обратно в карман. Особенно расстроен я не был, в глубине души на лучшее я и не надеялся. Вот так-то. Повторения всегда действовали на меня угнетающе, но жизнь, кажется, составлена из одних повторений, и смерть, должно быть, тоже некое повторение, я бы этому не удивился."

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorQuoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteLabel.text = text
//        guard let qoute = text.motivator else {
//            return
//        }
//        quoteLabel.text = text?.demotivator

        // Do any additional setup after loading the view.
    }
    

}
