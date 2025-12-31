# Font Setup Instructions

To use Google Fonts (Geist and Montserrat) in your iOS app:

## Step 1: Download Fonts from Google Fonts

1. Visit: https://fonts.google.com/specimen/Geist
   - Click "Download family"
   - Extract the zip file
   - Find `Geist[wdth,wght].ttf` or similar files
   - You need the SemiBold weight (600)

2. Visit: https://fonts.google.com/specimen/Montserrat
   - Click "Download family"
   - Extract the zip file
   - Find `Montserrat-Regular.ttf` and `Montserrat-SemiBold.ttf`

## Step 2: Add Fonts to Xcode Project

1. Drag the font files into the `Fonts` folder in Xcode
2. When prompted, make sure "Copy items if needed" is checked
3. **IMPORTANT**: Check "Add to targets: UnmesaiOS"

## Step 3: Verify Font Names

The actual font names inside the TTF files might be different. Check the console output when you run the app - it will print the actual PostScript names.

Common variations:
- Geist: "Geist", "GeistVF", "Geist-SemiBold"
- Montserrat: "Montserrat", "Montserrat-Regular", "Montserrat-SemiBold"

## Step 4: Update Info.plist (if needed)

If fonts still don't load, you may need to manually add them to Info.plist:
- Key: "Fonts provided by application"
- Values: 
  - Geist-SemiBold.ttf (or actual filename)
  - Montserrat-Regular.ttf
  - Montserrat-SemiBold.ttf

