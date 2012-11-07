# sample observable publish/subscribe pattern and usage

((window, doc, undef) ->
  topics = {}
  subUid = -1
  pubsub = {}
  pubsub.publish = (topic, args) ->
    return false  unless topics[topic]
    setTimeout ->
      subscribers = topics[topic]
      len = (if subscribers then subscribers.length else 0)
      subscribers[len].func topic, args  while len--
    , 0
    true

  pubsub.subscribe = (topic, func) ->
    topics[topic] = []  unless topics[topic]
    token = (++subUid).toString()
    topics[topic].push
      token: token
      func: func
    token

  pubsub.unsubscribe = (token) ->
    for m of topics
      if topics[m]
        i = 0
        j = topics[m].length

        while i < j
          if topics[m][i].token is token
            topics[m].splice i, 1
            return token
          i++
    false

  getPubSub = ->
    pubsub

  window.pubsub = getPubSub()
) this, @document

# usage
logPubSubUnsub = (topics,data) ->
  console.log topics + ': ' + data

pubsub.publish 'user', 1

initSubcriber = pubsub.subscribe 'accounts', logPubSubUnsub

setTimeout ->
  pubsub.unsubscribe initSubscriber
  , 0


  # with this simple pattern an event driven application can be
  # architected and namespaced with a single global var or exported
  # as a module


