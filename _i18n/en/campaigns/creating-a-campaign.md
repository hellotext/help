Learn how to create text message campaigns to reach your audience with communications and promotions that drive more revenue and attention towards your brand.

Text-based campaigns are one of the most effective way to capture your customer attention by delivering short and captivating messages that will be read almost immediately by the majority of its recipients. 

They are specially effective to build anticipation or drive more sales. The possibilities with text message as part of your regular marketing communication strategy to unlock new revenues opportunities are virtually endless.

To create a new campaign visit the *Campaigns* section and click on the *New Campaign* button near the top right of the page.

## Selecting an audience

Campaigns can reach all your subscribers base simply by keeping the *All audiences* options selected.

An estimated of the total subscribers that this campaign will reach is visible on the right side of the page.

Reaching all your subscribers may not be always desirable. Typically a campaign is most effective when its message targets a particular demographic.

It is a good practice to create different campaigns targeting specific audiences. If you are already using Lists or Segments, you can include them as audiences by selecting them from the *All audiences* dropdown.

You can include multiple Lists and Segments in your selection by clicking the <img src="/images/icons/add.svg" class="avatar-icon bg-blush" width="25" /> button at the right of the dropdown. 

The aggregated total of subscriber to reach will be visible on the right side of the page.

Learn more on **[Lists and Segments](/lists-and-segments)**

### Excluding audiences

It is possible to exclude certain audiences by selecting them first and then clicking on the *Include* label. 

For an audience to remain excluded, its label should say *Exclude*.

## Composing your message

Take your time to think a catchy message. Imagine yourself as the recipient. How would you feel receiving this text message?

Typically short and effective messages work better than longer ones. Your campaign will be delivered as a SMS text-based campaign. SMS have a limit of 160 characters. If you include characters that are non originally supported in the GSM-7 specification like accents and emojis, an encoding conversion to UCS-2 will be done and the total length per SMS message will be reduced to 80 characters. 

If your message excedes this limit it will require an additional SMS. Whenever possible we try to merge different SMS into one message and when this is not possible the message will be sent in separate SMS messages. 

A counter with the remaining SMS characters and the number of SMS messages this campaign will consume per subscriber is always available on the bottom right area of the compose.

A preview of the message is available on the right side of the page. It can help giving your an idea on how the message could look like when is split into different SMS.

### Add a shorten link

This feature creates a shorter version of any URL into a simple format that look like *hello.link/abcdef*.

We always recommend using this tool to shorten the URL that provided that will take visitors to your site, promotion or a product. 

The benefits of shortening links is two-fold: It keeps your message shorter with more extra characters for the actual message. 

It also keeps track of whom of your subscribers clicked on the short link and all the successive actions performed, like knowing who made a purchase, or completed a certain action. 

For this to work, you previously need to have installed the *Hellotext.js* tracker or created your own implementation to process the session and track the events using the API.

### Add tags

Make your messages more personal by referencing the properties of the subscriber. For example, displaying his name using the tag _{name}_. The delivered message will replace the tag with the name of the subscriber.

You can find tags for all your contact properties such as:

* *{name}*
* *{last_name}*
* *{phone}*
* *{birthday}*
* Any custom properties also have a matching tag following the same tag naming convention: For example, if the property is called _My Property_ a tag to reference this property will be automatically available with the name _{my_property}_

### Setting a default value

Not all your subscribers are likely to have the property you want to use in a tag set. For example, not everyone in your subscribers list may have a name. Depending how you craft your message this can make the message read odd if no value is shown. 

To solve this, you can pass a default value inside your tag separated by the pipe like _{name|customer}_.

If your message is for example:

* *Dear **{name&#124;customer}**, we have a special offer...*

For a subscriber without his name it will be sent as:

* *Dear **customer**, we have a special offer...*

### Add coupons

You can reference coupons already created. Referencing coupons instead of manually write them gives you powerful reporting and better insights and understanding in the impact they had in your campaign results.

### Choose sender

Messages are sent using the best routes possible. This is managed automatically by Hellotext so you don't need to worry about.

You can still specify any of your existing phone numbers as the sender including any short code that you may have associated.

## Schedule and deliver 

You can send your campaign right away or schedule it to send in the future on a particular day and time.

### Editorial review

Please keep in mind that if your campaign targets more than 100 subscribers it will be subject for a quick editorial review before it is delivered. 

During business hours this is fairly quick and usually takes less than 10 minutes.

Once a campaign is approved, it will continue its course to delivery. You do not need to do anything on your part during the approval process unless there is a request to adjust the campaign, in which case after a new change is made it will marked for review again.