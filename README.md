# adw-gtk3 GTK2 precolorized theme
To use this project, head to the gtk2 folder and select between the dark and light variants, then select which color you want and finally copy the `gtk-2.0` folder to where your `adw-gtk3` or `adw-gtk3-dark` theme is.  

Alternatively, you could use the `execute.sh` script.  
To do so: 
1. Clone the [adw-gtk2-colorizer](https://github.com/eylles/adw-gtk2-colorizer) repo
2. Copy the Gradience folder files and the `execute.sh` script into the adw-gtk2-colorizer folder.
3. Make execute.sh actually executable by doing `chmod +x execute.sh`
4. Run `./execute.sh` as either sudo or normal user depending on where your adw-gtk3 theme is installed:
    - sudo when adw-gtk3 is located at `/usr/share/themes/`
    - normal user when adw-gtk3 is located either at `~/.themes/` or `~/.local/share/themes/`

Usage: `./execute.sh <gradience_file.json>`  
  
This should also work with QT apps if using qt5ct with the qt5-style-plugins set to `gtk2`.  
Screenshot for reference:  
![clementine](/img/clementine.png)
> Clementine (a QT app) properly using red accent color from gtk2
---
### Credits:
* lassekongo83 (for creating adw-gtk3)
* GradienceTeam (for creating Gradience)
* demetrisk03 (for creating the gnome accent colors extension)
* eylles (for creating the adw-gtk2-colorizer tool)
