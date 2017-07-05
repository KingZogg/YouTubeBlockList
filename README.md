## YouTube Video ads Blocklist

Updated on: Wed 5 Jul 12:32:49 EDT 2017

___________________________________________

These domains are region specific and each device will get a different set of domains. You may get ad from other domains which are not included in the lists. **You can request additional domains via <a href="https://github.com/anudeepND/youtubeadsblacklist/issues">Issues</a> tab.**
 
Blocking video ads is kind of like Whack-A-Mole. The domain names often change, so users feedback is very helpful. 
Also there's is no guarantee that this list will block 100% of the ads, however the results were promising.
One should also note that the actual content is also delivered using similar domains, for example `rx---sn-gwpa-cags.googlevideo.com` Blocking this will prevent the video from playing!  
Add ```https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/domainlist.txt``` file to adlist.


#### **Important Note:** YouTube seems to cache ads, so please clean cache after adding or updating this list. 

# FAQs

##### 1). How do I determine an ad domain?

##### a). DNSthingy Assistant

<a href="https://chrome.google.com/webstore/detail/dnsthingy-assistant/fdmpekabnlekabjlimjkfmdjajnddgpc">This browser extension</a> will list all of the domains that are queried when a web page is loaded. You can often look at the list of domains and cherry pick the ones that appear to be ad-serving domains.


![Alt text](https://discourse.pi-hole.net/uploads/default/optimized/1X/6ce0e13813df930288677c87bf0fd5861c150898_1_690x320.png)
 
 
 
##### b). Using inbuilt Developer tool
For Chrome ctrl+shift+I will land you in Developer tools menu.
![Alt text](http://i.imgur.com/44CHRLV.png)


#### 2). I'm receiving connection timeout error while playing videos.
Make sure the traffic on port 443 is rejected. Use the below iptables rule: 
 
 ```sudo iptables -A INPUT -p tcp --destination-port 443 -j REJECT``` for IPv4  
 ```sudo ip6tables -A INPUT -p tcp --destination-port 443 -j REJECT``` for IPv6
 
 
