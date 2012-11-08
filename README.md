# Pubber Event Driven Application Framework

An observer-like implementation facilitating a network of susbcriptions
for event-driven architectures.

# Todo Application with Pubber

## able to
* create lists
* remove items

## waiting to
* check off items
* clear completed


# Motivations

* An event driven application architecture
* loose coupling


# usage: pubber(customEventName, argument)

# examples

## subscribe to newSignup events and pass an argument
### this creates a subscription and publishes the argument

```coffeescript
pubber newSignup
	action:'notify'
```

## unsubscribe from newSignup events

```coffeescript
app.pubber.revoke newSignup
```


## publish argument to an event name

```coffeescript
app.pubber newSignup
	action:'change'
```


