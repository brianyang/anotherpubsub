# define a function perform the logging action showing the topic and data rcvd
logger = (topics,data) ->
  console.log 'expect topic:data'
  console.log 'topic: ' + topics + ': '
  console.log data

# create a subscriber to a topic and pass the response to the logging method
subscribeTopic = pubsub.subscribe 'user', logger

# publish an object to the topic
pubsub.publish 'user'
    foo:'bar'

initSubscriber

# define a function to have it evaluated after\
setTimeout ->
  pubsub.unsubscribe initSubscriber
  , 0


