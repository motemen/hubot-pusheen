module.exports = (robot) ->

  robot.respond /pusheen/i, (msg) ->
    msg.http("http://motemen.github.io/pusheen-explorer/data/entries.json")
      .get() (err, res, body) ->
        entries = JSON.parse(body)
        msg.send entries[Math.floor(Math.random() * entries.length)].photo.url
