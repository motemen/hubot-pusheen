# Description:
#   Random Pusheen image
#
# Configuration:
#   None
#
# Commands:
#   hubot pusheen - shows random pusheen image
#
# Author:
# motemen <motemen@gmail.com>

module.exports = (robot) ->

  robot.respond /pusheen/i, (msg) ->
    msg.http("http://motemen.github.io/pusheen-explorer/data/entries.json")
      .get() (err, res, body) ->
        entries = JSON.parse(body)
        photos = Array.prototype.concat.apply([], entries.map (e) -> e.photos)
        msg.send photos[Math.floor(Math.random() * photos.length)].url
