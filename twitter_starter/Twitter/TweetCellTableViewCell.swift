//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Huanjia Liang on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetID:Int = -1
    var retweeted:Bool = false
    
    func set_Favorite(_ isFavorite:Bool)
    {
        favorited = isFavorite
        if(favorited == true)
            {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            }
        else
            {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            }
    }
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited == true)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {self.set_Favorite(true)}, failure:{(error) in
                print("Favorite did not succeed.")
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {self.set_Favorite(false)}, failure:{(error) in
                print("Unfavorite did not succeed.")
            })
        }
    }
    

    @IBAction func retweet(_ sender: Any) {
            TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
                self.setRetweeted(true)
            }, failure:{(error) in print("Error in retweeting")})
        }
    
    func setRetweeted(_ isRetweeted: Bool)
    {
        retweeted = isRetweeted
        if(retweeted == true)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
