# FluentApp

Welcome to the FluentApp! This app is intended for users to practice a language of their choice with the best resource there is - native speakers.
By signing up with this app, a user can set their own native languages so that they are also able to receive phone calls from callers who intend on practicing that same language. 

This app's main priority is privacy. What makes this app great is that it will select a random user of that native language, not providing their name or any other information. This allows you to not have preferences with the spekears as well as with the active callers. 

The goal is to be able to allow the "speakers" of a specific language to be able to be payed by the user making the call - the "caller" - by the minute of conversation.

A great way to brush up on a particular language, either just for learning purposes, before a job interview, and many more scenarios!


## Installation

To install, make sure all gems or their equivallent versions are installed properly. 
Be sure to bundle with your bundler of choice. 

```bash
bundle install
```
Create a `.env` file in the main directory. It should be included in the `.gitignore` file.
In the `.env` file, add the appropriate "GOOCLE_CLIENT_ID" and "GOOGLE_CLIENT_SECRET". 

## Usage

```ruby
import foobar

foobar.pluralize('word') # returns 'words'
foobar.pluralize('goose') # returns 'geese'
foobar.singularize('phenomena') # returns 'phenomenon'
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

## License
[MIT](https://choosealicense.com/licenses/mit/)
