// Make sure you have done the following:
// - Disable App Thining
// - In the tiapp.xml add the following
// - Add the icon images under app/assets/  
var tiAlternateIcons = require('ti.alternateicons');
console.info('module is => ' + tiAlternateIcons);

// Validates that iOS is 10.3 or greater
console.info('isSupported: ' + tiAlternateIcons.isSupported());
// Native method that returns if the alternate icons are supported
console.info('supportsAlternateIcons: ' + tiAlternateIcons.supportsAlternateIcons());

// Samp le window
var win = Ti.UI.createWindow({
	backgroundColor: '#FFFFFF'
});
var buttonSetDefaultIcon = Ti.UI.createButton({
	top: 30,
	title: 'Set Default Icon'
});
var buttonSetAlternateIcon = Ti.UI.createButton({
	top: 80,
	title: 'Set Alternate Icon'
});
var buttonAlternateIcon = Ti.UI.createButton({
	top: 130,
	title: 'Get Icon Name'
});

buttonSetDefaultIcon.addEventListener('click', function(_evt){
	if (tiAlternateIcons.isSupported() && tiAlternateIcons.supportsAlternateIcons()) {
		tiAlternateIcons.setDefaultIconName();	
	} else {
		alert('Not supported');
	}
});
buttonSetAlternateIcon.addEventListener('click', function(_evt){
	if (tiAlternateIcons.isSupported() && tiAlternateIcons.supportsAlternateIcons()) {
		tiAlternateIcons.setAlternateIconName('alloy');
	} else {
		alert('Not supported');
	}
});
buttonAlternateIcon.addEventListener('click', function(_evt){
	if (tiAlternateIcons.isSupported() && tiAlternateIcons.supportsAlternateIcons()) {
		var iconName = tiAlternateIcons.alternateIconName();
		if (iconName) {
			alert('Current icon name is: ' + iconName);
		} else {
			alert('Default icon returns as null');
		}
	} else {
		alert('Not supported');
	}
});

win.add(buttonSetDefaultIcon);
win.add(buttonSetAlternateIcon);
win.add(buttonAlternateIcon);

win.open();



