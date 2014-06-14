# Half-Time - Remove football tweets from your timeline.
Original code from https://github.com/rstuven/OpenTweetFilter

The open source browser extension to filter tweets.

## Features:
- You can filter out tweets by their contents or by their authors.
- You can filter out tweets using regular expressions (for example, all words beginning in "auto" using:  /\Wauto/) 
- You can save your filters using bookmarklets.

## Usage

1. Install the official release from [Chrome Web Store](https://chrome.google.com/webstore/detail/bdmjagdcpkfpebaaffpafncgkleijako) or [the latest version for Firefox or Safari from here](https://github.com/rstuven/OpenTweetFilter/tree/packages).
1. Refresh you *twitter.com* page.
1. Select the **Filters** option [in the gear icon drop down menu (just below "Lists" option)](http://goo.gl/iZCX8).
1. Enter terms separated by commas in the first field.
1. Enter user names separated by commas in the second field.
1. Toggle **Including** / **Excluding** button before each field.
1. Toggle **Show report of filtered tweets** checkbox.
1. Toggle **Enable** / **Disable** button in the dialog footer.
1. Save the configuration as a bookmarklet. Just drag the **OpenTweetFilter Settings** box and drop it to the bookmarks bar, then you can rename it to describe the filters. You can create as many bookmarklets as you want.
1. Press **Clear** to reset all fields.

Feel free to experiment with the effect of all these settings. The tweets are not deleted but just hidden, so you can get them back any time by disabling the filter or changing the criteria.

*NOTE:* We respect your privacy, so no data is sent to any server. Your filters are processed in your computer and stored in your browser local storage (so **please, use the bookmarklet feature or keep a copy of your filters in a safe place**).

To suggest a feature, report a bug, or general discussion:
http://github.com/rstuven/OpenTweetFilter/issues/

## Development

1. Install Node.js, and then the CoffeeScript compiler:

		npm install -g coffee-script

1. Fork and clone the repository, then build the extension:

		cake build

	(To see more commands, just type `cake`.)

### Chrome

1. In Google Chrome, open **Tools > Extensions**, activate **Developer mode**, then **Load unpacked extension** and select the **build** directory.

1. Disable the version installed from Chrome Web Store, if applies.

## Acknowledgements

**Open Tweet Filter** logo by [@StoicYoic](https://twitter.com/StoicYoic) using *Twitter Bird* by [~freakyframes](http://freakyframes.deviantart.com/art/Twitter-Bird-127757230) and *Funnel Icon* by [IconEden](http://www.veryicon.com/icons/system/fresh-addon/funnel.html).

## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)
Copyright 2012 [Ricardo Stuven](mailto:rstuven@gmail.com)
