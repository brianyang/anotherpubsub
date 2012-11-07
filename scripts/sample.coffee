 # define function perform the logging action showing the topic and data rcvd
logData = (topics,data) ->
  console.log 'from subscribed'
  console.log topics + ': ' + data

# create a subscriber to a topic and pass the response to the logging method
subscribeTopic = pubsub.subscribe 'user', logData

# publish an object to the topic
pubsub.publish 'user', {foo:'bar'}

# define a function to have it evaluated after\
setTimeout ->
  pubsub.unsubscribe initSubscriber
  , 0

