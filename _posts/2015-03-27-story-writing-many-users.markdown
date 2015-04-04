---
layout: post
title: "Many users of many types"
date: 2015-03-27 11:23:00
edit_date: "4/4/2015"
edit_url: "https://github.com/michaeldfallen/michaeldfallen.github.io/commits/master/_posts/2015-03-27-story-writing-many-users.markdown"
---

{% include series/story-writing/header.markdown %}

There’s a problem with the “As a user...” that never sat right with me. Who is
the user? What defines a user? I think there's too much focus only on the typical
user, the person sitting in front of a browser [registering to vote], or
[viewing their Driving License], etc.

I don’t agree.

I define a user as: “someone who will use a product of our teams work to do
something”

It’s a pretty loose definition but it covers all the typical users but also some
of the groups I see ignored when we talk about users. These include:

*Your Support team* who will read your logs, code, and documentation to fix bugs
and improve the service.

*Your Service team* who will use your analytics, dashboards, and admin
interfaces to support the running of the service in live.

*Any Developers* making other things, who will use your APIs to fulfill their
users needs and provide business value to their company.

These people are often ignored in the consideration of a typical user. Any
stories written for them often get shoehorned into a more “typical” user need.

As I mentioned in [Rule 3 - Who-What-Why not Who-What-What] when you hide the
real reason, or in this case the real user, you prevent the team from fully
understanding the Need behind it.

------------------

**The Team are never the user**. It was pointed out on twitter that I hadn't
stated this explicitly. The people who build the thing, the Developers, the
Business Analysts, the Designers, aren't covered by my definition of a user.
It's their responsibility to understand and fulfill the users needs and so they
don't get to have stories.

If the Developers want something we need to write a story that states what user
need or business need is fulfilled by it. If we can't find a need then we
shouldn't do it because we would just be wasting time. For example, we are often
tempted to put building a Continuous Integration pipeline into a
"As a Developer..." story. Instead we should tie this to a business need:

    In order to be able to react quickly when things go tits up
    the delivery team
    will need to be capable of deploying to production within 5 minutes

{% include series/story-writing/header.markdown %}
{% include series/story-writing/links.markdown %}

{% include edited.markdown %}

[registering to vote]:https://gov.uk/performance/register-to-vote
[viewing their Driving License]:https://www.gov.uk/transformation/exemplars/driving-record.html
