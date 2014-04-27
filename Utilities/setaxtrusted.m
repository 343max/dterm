//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.

int main(int argc, const char * argv[]) {
	if(argc != 2) {
		NSLog(@"usage: setaxtrusted <path>");
		return -1;
	}
	
	if(geteuid() != 0) {
		NSLog(@"setaxtrusted must be run as root");
		return -1;
	}
	
	AXError err = AXMakeProcessTrusted((__bridge CFStringRef)@(argv[1]));
	if(err != kAXErrorSuccess)
		NSLog(@"AXMakeProcessTrusted failed: %d", err);
	
	return err;
}