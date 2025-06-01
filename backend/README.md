# ApparenceKit - firebase functions template

## Pre-requisites

You must have firebase tools installed globally

```sh
npm install -g firebase-tools
```

Be careful to use node version 18
[See firebase node version](https://firebase.google.com/docs/functions/manage-functions?gen=1st#set_nodejs_version_2)

## Setup firebase project

- create a new project on firebase console if you don't have one already
- call this method and choose the project you just created
``` 
firebase use --add
```

## Getting Started

- clone this repo (or create a new one from this template)
- install dependencies 

```sh
npm install
```

Deploy functions

```sh
firebase deploy --only functions
```

## Setup notifications

open the functions/notifications/triggers.ts file and set the notification channel you have setup on your app

```ts
kChannelId = "your_channel_id";
```


## RevenueCat webhook 

### 1 - deploy the webhook secret 

```sh
firebase functions:secrets:set revenuecat_webhook_key
```
You will be prompted to enter the secret value. 
This is the secret key you have set in your RevenueCat webhook settings.

(example: `Bearer 134354d54dskglmjpooi`) 
Don't use this exact value, it's just an example.
Don't forget to add the `Bearer ` prefix with space before the key.

### 2 - Enable the subscription function

Open the index.ts and uncomment the line that imports the webhook function
```ts
// uncomment this line
// exports.subscriptions = require("./subscriptions/subscriptions_functions");
```

### 3 - deploy the webhook function

```sh
firebase deploy --only functions
```