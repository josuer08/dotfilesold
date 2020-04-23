# "Happy Birthday!" Bug Fix Proposal Report

## Description:

After the incorporation of the new feature for multiple birthday registrations a bug appeared. You can reproduce this bug by, after registering one person, choosing **YES** in the prompt `"Would you like to add another person?"`, after said action the app would overwrite the last person registered locally with the new one and at the end of the operation would only send the information of the last person registered in the app.

This bug is probably occurring because the same variables are being reused instead of putting all the persons in one array, resulting this in the deletion of all the old data every time a person register their relatives.

## Proposed fixes:

### Proposed fix #1

> Multiple requests to the API.

A solution that can be simple, that would affect minimally the code base of the app and have many advantages is to send a request to register the person just before asking for the `"Would you like to add another person?"` prompt, that way we can not only fix the bug but also it acts as a mechanism to prevent the lost of all the data in case of an interruption in the app.

The major downside to this is the fact that in this way we are going to increment the amount of request that we are going to get from the app from just one to the amount of persons someone registers.

The code at this time might look something like this:

```python
bool continue = True
while(continue):
	print("What is your name?")
	name = scan();
	print("What month where you born?")
	birthMonth = scan();
	print("What day in {{birthMonth}} where you born?")
	birthDay = scan();
	print("{{name}}, what is your email?")
	email = scan();
	print("Everything is ready")
	print("Would you like to add another person?")
	continue = scan();//True repeats the loop
registerOnServer(name, birthDay, birthMonth, email) //request only with last data
```



The main idea is to get to something like this:

```python
bool continue = True
while(continue):
	print("What is your name?")
	name = scan();
	print("What month where you born?")
	birthMonth = scan();
	print("What day in {{birthMonth}} where you born?")
	birthDay = scan();
	print("{{name}}, what is your email?")
	email = scan();
	print("Everything is ready")
	registerOnServer(name, birthDay, birthMonth, email) //request before overwrite
	print("Would you like to add another person?")
	continue = scan();//True repeats the loop
	
```



### Proposed fix #2

> Caching in an array

Another solution would be to save every person in one array locally, so the data does not get overwritten, this solution could be a little more intrusive in the code and require more local resources, but would not increase the amount of requests like in the other solution. The deciding factor between this two would be the capacity of our servers, but they both solve our problem.

The idea here is to do something like this:

``` python
bool continue = True
name = []
birthMonth = []
birthDay = []
email = []
while(continue):
	print("What is your name?")
	name.add(scan())
	print("What month where you born?")
	birthMonth.add(scan())
	print("What day in {{birthMonth}} where you born?")
	birthDay.add(scan())
	print("{{name}}, what is your email?")
	email.add(scan())
	print("Everything is ready")
	print("Would you like to add another person?")
	continue = scan() // True repeats the loop
Data = convertToJSON(name, birthDay, birthMonth, email))
registerOnServer(Data) //request with all of the data
```

<div dir="rtl">
Oscar J Rodriguez B
</div>

