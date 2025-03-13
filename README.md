# BeatBlock Mods Template

Im not a game dev or beatblock+ dev.  
This is a template to modding [BeatBlock](https://store.steampowered.com/app/3045200/Beatblock/). This template fits [lovely-injector](https://github.com/ethangreen-dev/lovely-injector/releases/) with [BB+](https://github.com/BeatblockTools/BeatblockPlus/releases/).  
More about this [here](https://github.com/BeatblockTools/BeatblockPlus/wiki).  

---

# Include Files

If you don't trust the pre-installed files, you can reinstall them yourself. Name them the same as before, for convenience.  
[7zip terminal](https://www.7-zip.org/download.html)  
[jq](https://jqlang.org/)

# Usage

! All batch files gets names from `mod_info\mod.json`, `id` !  
`install_mod.bat` - install mod to folder: `%USER%\AppData\Roaming\beatblock\Mods`  
`delete_mod.bat` - delete mod from folder `%USER%\AppData\Roaming\beatblock\Mods`  
`reinstall_mod.bat` - reinstall mod. Just `delete_mod.bat` and `install_mod.bat`.
`export_mod.bat` - export mod to archive `.\mod-id_version.zip`

# Links:

BeatBlock Game: https://store.steampowered.com/app/3045200/Beatblock/  
lovely-injector : https://github.com/ethangreen-dev/lovely-injector/releases/  
Beatblock+ : https://github.com/BeatblockTools/BeatblockPlus/releases/  
Beatblock+ wiki (all info there): https://github.com/BeatblockTools/BeatblockPlus/wiki  
7zip terminal: https://www.7-zip.org/download.html  
jq: https://jqlang.org/