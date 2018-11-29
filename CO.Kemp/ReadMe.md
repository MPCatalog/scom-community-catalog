# CO.Kemp

A System Center Operations Manager management pack for monitoring KEMP Loadmaster nodes and clusters.  
Uses the KEMP REST-API instead of SNMP.

## How to contribute

- Create your own fork to develop against, always use the correct branch/tag as base for your changed (see [branches](#Branches) and [tags](#Tags))
- Create a suitable branch for your changes to work on
- Before starting, make sure you're in sync with the upstream repository
- Write useful commit messages (we need to understand the "what" and "why")
- Maintain the changelog
- Pull from upstream and test merge before creating a pull-request

## Project dependencies

### IDE

The project is developed using **Visual Studio 2015+** with **Visual Studio Authoring Extensions** installed.
Since it is OpenSource, it is compatible, both technically and legally, with Visual Studio Community Edition.

To make development and distribution simpler, we copy any compiled/built `.mp`, `.mpb` and `.xml`-files to the /LatestBuild folder.  
Easiest way to do this is using the *Auto Deploy* extension for Visual Studio. Configure it to copy these files to `../LatestBuild`.

### Strong Name Key-file for Signing

We do **not** distribute this with the repository. Feel free to make your own for development, but we prefer to keep control over who can sign the MP using the "official" key. 
Functionally, this means that you can modify and sign with your own Strong Name Key-file, but any user have to remove the version available from this repository before import. That way, we can say that if there is a key issue on import, they are not using our signed MP. 

However, any approved pull-request will trigger a build using our key and those changes will be included in our distributed MP.  
We would suggest that you do NOT include your `.snk`-file in your pull-requests. In fact, add it to your `.gitignore`-file or simply rename your local key to the same filename we use and will all go automatically.

## Branches

### master

This is our "stable" branch. Stuff here is tested and, hopefully, true. 

### develop

Our base for active development. Feature branched are created with `develop` as base and changes will be merged back into `develop` when done. 

### feature/*

All feature-branches should be named `feature/the-feature-i-am-working-on`. If you are working on an issue (not hotfix), please make a feature-branch for it. I.e. `feature/issue-21` or similar.  
These are a great place to test stuff out.

When you consider your feature done, pull develop from upstream, merge into your feature branch, test. If it's working, create a pull-request against our `develop`.

### hotfix/*

Hotfix branches are used when there's a severe issue with the something in the master ("stable") branch. These branches are created from either the latest master or the relevant version tag. When tested and true, create a pull-request against master. We will make sure `develop` is updated as needed.  
Hotfix branches must follow the `hotfix/issue-ISSUENUMBER` convention. 

## Tags

There will be a version-tag created for every "significant" release. 

There will always be the latest and greatest available from the LatestBuild directory in `develop`, if you want to live on the edge. These should be functional as most work is made against feature-branches, but who knows?

When a feature-set is completed or a hotfix implemented, `master` will be updated and a version-tag will be set.
