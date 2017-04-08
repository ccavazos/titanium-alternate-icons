/**
 * Titanium Alternate Icons (Hyperloop)
 * @version 1.0.1
 * @author ccavazos
 */
var UIApplication = require('UIKit/UIApplication');
var UIDevice = require('UIKit/UIDevice');
var NSNumericSearch = require('Foundation').NSNumericSearch;
var NSOrderedAscending = require('Foundation').NSOrderedAscending;

exports.isSupported = function() {
    return UIDevice.currentDevice.systemVersion.compareOptions('10.3', NSNumericSearch) != NSOrderedAscending;
};

exports.supportsAlternateIcons = function() {
    return !!UIApplication.sharedApplication.supportsAlternateIcons;
};

exports.alternateIconName = function() {
	var iconName = String(UIApplication.sharedApplication.alternateIconName);
	if (iconName == null) {
		return null;
	} else {
		return iconName;	
	}
};

exports.setAlternateIconName = function(iconName, cb) {
	UIApplication.sharedApplication.setAlternateIconNameCompletionHandler(iconName, function(error) {
        if (!cb) {
            return;
        }
        
        var event = {
            success: error == null
        };
        
        if (error != null) {
            event.error = error.localizedDescription;
        }
        
        cb(event);
	});
};

exports.setDefaultIconName = function(cb) {
	exports.setAlternateIconName(null, cb);
};
