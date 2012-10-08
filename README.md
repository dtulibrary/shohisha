shohisha
========

Provider-Consumer metadata and access control

This ruby project creates a concept of providers which deliver some sort of
data.  And consumers which are granted access to this data.

Resource structure
------------------

The following resources are available
    providers
    consumers
    packages
    provider_types
    deliver_periods
    supplies
    fetchers
    transports
    ipaddresses
    retain_types
    fulltexts
    statuses

The 2 key resources are providers and consumers.

Providers have the following resources attached to it. This means that the
following resources have a provider_id in them.
    packages
    fetchers
    ipaddresses

Providers references the following structures
    provider_types
    supplies

There is a link between consumer and provider, and between consumer
and packages.
This link contains a reference to a fulltext resource.

Fetchers contains a reference to the following resources:
    transports
    statuses
    retain_types
    deliver_periods

Fetchers are used to get information about how to get data from a provider.

Ipaddresses contain an IP address, IP address range or a IP address/bitmask.

Supplies is used to identify what kind of data the provider supplies.

Statutes is used to give the status for a given fetcher.


REST interface
--------------

Data can be extracted through a REST based interface.

For each resource available you can do the follwing requests
    GET /<resource>
    GET /<resource>/<id>
    PUT /<resource>
    POST /<resource>/<id>
    DELETE /<resource>/<id>

The returned format will default be HTML. But by adding .json you can get
a json struct returned instead.

The following special REST apis exists.
    GET /ipaddresses.json
    GET providercode/<code>(.json or .text)
    GET /providers/<id>/consumers_providers.json
    GET /consumers/<id>/consumers_providers.json
    GET /providers/<id>/consumers_packages.json
    GET /consumers/<id>/consumers_packages.json

ipaddresses will return a list of all registered IP addresses which should
have access to our ftp server.

providercode can return the number of a provider based on the code.
If you request text format, only the ID number is returned.

consumers_providers and consumers_packages will return information about
links between consumer - provider and consumer - packages respectivily
These can only be used with json format.


How to use the REST interface
-----------------------------

To get a list of providers do:

    GET /providers.json

This will return an array of providers in the JSON format.
This could look like this:
[
  {"code":"acm",
   "created_at":"2012-08-17T09:50:08Z",
   "description":"American Computer Manufactoring",
   "id":1,
   "provider_type_id":1,
   "updated_at":"2012-08-17T09:50:08Z"
  },
  {"code":"ebsco",
   "created_at":"2012-08-21T06:48:09Z",
   "description":"EBSCO",
   "id":2,
   "provider_type_id":1,
   "updated_at":"2012-08-21T06:48:09Z"
  },
  {"code":"alephcash",
   "created_at":"2012-09-11T11:57:12Z",
   "description":"Aleph Cash",
   "id":3,
   "provider_type_id":1,
   "updated_at":"2012-09-11T11:57:12Z"
  }
]

Any value in the returned information from a REST request which ends in 
"_id" is a mapping to another view.
You can find the reference name by removing "_id" and add "s" to the name.
If the name ends in a "s" you must add "es".

So in the returned provider data you can lookup the provider type by doing
  GET /provider_types/<value>

If you find you need to do a lot of lookup on the type. You can also get the
full list of provider_types by doing
  GET /provider_types
And then do the mapping yourself.

You can lookup a single provider by doing:
  GET /provider/<id>.json

E.g.
  GET /providers/1.json

could return:
{
  "code":"acm",
  "created_at":"2012-08-17T09:50:08Z",
  "description":"American Computer Manufactoring",
  "id":1,
  "provider_type_id":1,
  "updated_at":"2012-08-17T09:50:08Z"
}

For a single provider yuo can also get a list of attached consumers, packages
and fetchers.

E.g. to get all consumers for a given provider:
    GET /providers/1/consumers.json

Which return an array of consumers linked to the given provider.
Like this:
[
  {"code":"dtu",
   "created_at":"2012-08-20T09:53:46Z",
   "description":"DTU employees and staff",
   "id":1,
   "updated_at":"2012-08-20T09:53:46Z"
  },
  {"code":"dtu_pub",
   "created_at":"2012-08-20T13:21:42Z",
   "description":"Public DTU",
   "id":2,
   "updated_at":"2012-08-20T13:21:42Z"
  }
]

Getting provider packages or consumer packages works the same way
    GET /providers/2/packages.json

Which would return something like this:
[
  {"code":"ebsco_afh",
   "created_at":"2012-09-26T15:01:48Z",
   "description":"Ebsco AFH",
   "id":3,
   "provider_id":2,
   "updated_at":"2012-09-26T15:01:48Z"
  },
  {"code":"buh",
   "created_at":"2012-08-21T06:54:19Z",
   "description":"EBSCO Buh",
   "id":1,
   "provider_id":2,
   "updated_at":"2012-08-21T06:54:19Z"
  }
]

Or if no packages are available (needed) it will return [].

    GET /consumers/1/packages.json

Would return all packages for all providers like this:
[
  {"code":"buh",
   "created_at":"2012-08-21T06:54:19Z",
   "description":"EBSCO Buh",
   "id":1,
   "provider_id":2,
   "updated_at":"2012-08-21T06:54:19Z"
  },
  {"code":"acm_package",
   "created_at":"2012-09-26T10:50:13Z",
   "description":"Acm Package",
   "id":2,
   "provider_id":1,
   "updated_at":"2012-09-26T10:50:13Z"
  }
]


To get the actual information about a link between consumer and provider
you use:
    GET /consumers/1/consumers_providers.json

That will get all links from consumer 1 to a provider.
It looks like this:
[
  {"consumer_id":1,
   "created_at":"2012-08-20T14:55:52Z",
   "fulltext_id":1,
   "id":1,
   "provider_id":1,
   "updated_at":"2012-08-20T14:55:52Z"
  }
]

That same is possible for packages
    GET /consumers/1/consumers_packages.json

Or from the provider perspective
    GET /providers/1/consumers_providers.json
    GET /providers/1/consumers_packages.json
