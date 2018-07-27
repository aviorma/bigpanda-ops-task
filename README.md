# ops-exercise
BigPanda Exercise for Ops Engineers.

Tested on Python 2.7.12

## Dependences Installation
```
pip install os wget time human_curl
```

## Running Instructions

```
./execute_bigpanda_env.sh
```


## Script Result
For 200 status code the following message will be present  'Panda Environment has been start successfully'.

For 500 status code the following message will be present 'Panda Environment is Unavailable'.


## App Healthcheck

For the app healthcheck navigate to the following url: http://\<host\>:3000/health

This would return a 200 (Ok) healthcheck response in a JSON format. In cases where the healthcheck is bad, the response would be the same JSON format with a 500 (Internal Server Error) response.
