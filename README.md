# Motivations

* An event driven application architecture
* loose coupling


# usage: pubber(customEventName, argument)

# examples

## subscribe to newSignup events and pass an argument
### this creates a subscription and publishes the argument

pubber newSignup
	action:'notify'


## unsubscribe from newSignup events

app.pubber.revoke newSignup


## publish argument to an event name

app.pubber newSignup
	action:'change'


