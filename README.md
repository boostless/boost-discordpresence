# boost-discordpresence
Discord rich presence with included job's

# Configuration 

1. Go to https://discord.com/developers/applications
2. Create a Application and a Bot (tuto : https://discordpy.readthedocs.io/en/stable/discord.html)
3. Click on your App.

![image](https://user-images.githubusercontent.com/39769703/214170463-9a5d8231-f1c8-413f-be03-b5f6f1a5b1c0.png)

5. Here you can see your CLIENT ID copy and paste it into your config.lua file.

![image](https://user-images.githubusercontent.com/39769703/214170560-04b00055-5b95-4b27-8ab2-38fff3b2997e.png)


7. On the left menu clic on Rich Presence and select Art Assets.
8. Here you have to add the images for the jobs.
 ⚠ __The name of the icon needs to be the same as the job in the database__ ⚠

![image](https://user-images.githubusercontent.com/39769703/214170744-e231828c-bb65-45dd-8c60-e3977e1577f9.png)

7. Its fine !

# Dependencies

* ESX Legacy
* esx_identity
* mysql-async
* Discord Bot

# Change Log

* 1.0.0 Initial Release
* 1.0.1 Added Config File
* 1.0.2 Fixed not getting player count
* 1.0.3 Added esx_identity support for players firstname and lastname
* 1.0.4 Added additional checks
* 1.0.5 Added buttons thanks to https://forum.cfx.re/t/free-discord-action-buttons-simple-script/2329755
* 1.0.6 Fixed issues and rewriten the code
* 1.0.7 Make it compatible with ESX Legacy
