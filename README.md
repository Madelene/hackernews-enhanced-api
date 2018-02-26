# HackerNews Enhanced API

The challenge was to implement an enhanced [HackerNews](https://github.com/HackerNews/API) top stories API. This resource should provide a list and a detail endpoint.

* `/stories/`
* `/stores/:id`


# GET `/stories/`
Return a JSON covering a list of HackerNews top story objects. 

## Parameters
* **count** (default: *10*) -- limit the number of top stories returned
* **order** (options: *title*, *by*, *score*) -- sort the retrieved stories by the specified key

## Detail

You will need to retrieve the list of [Top Stories](https://github.com/HackerNews/API#new-top-and-best-stories) (`/v0/topstories`), then retrieve the [Item](https://github.com/HackerNews/API#items) object for each top story ID.

Example (`/stories/?count=2`):
```json
[
  {
		"by": "foo",
		"descendants": 2,
		"id": 42,
		"kids": [111, 222],
		"score": 99,
		"time": 1175714200,
		"title": "Example 1",
		"type": "story",
		"url": "http://www.google.com/1"
	},
	{
		"by": "bar",
		"descendants": 3,
		"id": 43,
		"kids": [333, 444, 555],
		"score": 80,
		"time": 1175714200,
		"title": "Example 2",
		"type": "story",
		"url": "http://www.google.com/2"
	}
]
```

# GET `/stories/:id`
Return JSON response covering a single HackerNews story.

## Parameters
* **count** (default: *10*) -- limit the number of comments included in **comments**

## Detail

The endpoint returns an individual top story [Item](https://github.com/HackerNews/API#items) object with its associated comments.

Add the new **comments** array to the story detail response. This array should contain up to N (N=`count`) total comment [Items](https://github.com/HackerNews/API#items). For each included comment, retrieve the comment object by its ID, represented under the original **kids** array for the story.

Example (`/stories/43/?count=2`)
```json
{
	"by": "bar",
	"descendants": 3,
	"id": 43,
	"kids": [333, 444, 555],
	"comments": [{
			"by": "baz",
			"id": 2921983,
			"kids": [],
			"parent": 43,
			"text": "Hello, world",
			"time": 1314211127,
			"type": "comment"
		},
		{
			"by": "baz",
			"id": 2921983,
			"kids": [45],
			"parent": 44,
			"text": "Hello, world",
			"time": 1314211127,
			"type": "comment"
		}
	],
	"score": 80,
	"time": 1175714200,
	"title": "Example 2",
	"type": "story",
	"url": "http://www.google.com/2"
}
```
## To run tests:
 run: `bundle exec rspec`
 
## To run the app and test in Postman:
 run: `bundle install` to install the gems
 and `rails s` to start the server
 
