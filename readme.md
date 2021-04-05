## Repo organization 

This project test the cross language support for Java in Ray. 

- `ScalaSparkTest` project is a small scala project using sbt, that calculates the value of PI using Spark. This project is assembled in a fat `.jar`.

- `script_x.py`: A script that executes a java class code from the assembled `jar` as a Ray Actor using python code. 

--------

## Running the python scripts

- Is required to `assembly` the scala project and generate the fat `scala-pi.jar`. 

- Copy the `ScalaSparkTest/target/scala-2.11/scala-pi.jar` to repository root folder. 

- Activate the poetry virtual environment for python dependencies. 

- Execute the python scripts. 

--------

## Testing the scripts in a single laptop

### `script_one.py`

1. Execute script: `$ python script_one.py`

The Ray dashboard state: 

![Dashboard image](images/script_one.png)

Console output: 

```
>>> python script_one.py 
2021-04-05 17:56:39,478 INFO services.py:1172 -- View the Ray dashboard at http://127.0.0.1:8265
Pi is: 3.141501872
```

### `script_two.py` 

1. Init ray from the command line: `$ ray start --head --port=6379`
2. Execute script: `$ python script_two.py`

The Ray dashboard state:

![Dashboard image](images/script_two.png)

Console output: 

```
>>> python script_two.py 
2021-04-05 18:01:49,644 INFO worker.py:654 -- Connecting to existing Ray cluster at address: 192.168.2.101:6379
Pi is: 3.1414846
```
