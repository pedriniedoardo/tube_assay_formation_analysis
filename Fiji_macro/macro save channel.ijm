dir = getDirectory("Choose source directory"); 
list = getFileList(dir); 
dir1 = getDirectory("Choose destination directory");
print(dir);
print(dir1);
print(list.length);

for(i=0; i<list.length;i++){
	print(list[i]);
}
setBatchMode(true);
for(i=0; i<list.length;i++){
	l = lengthOf(list[i]);
	sub = substring(list[i],l-3,l);
	if(sub=="ics"){
		print(list[i]);
		// open the ics file in sequence
		run("Bio-Formats Importer", "open=["+ dir + list[i] + "] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		// split the stack into images
		run("Stack to Images");
		name = File.nameWithoutExtension();
		print(name);
		selectWindow("c:1/1, c:2/4 - "+ name);
		out_path = dir1 + name + ".tif";
		saveAs("tiff", out_path);
		//run("Bio-Formats Importer", "open=[D:\\belfast\\project Lydia\\Tube analysis\\image\\test\\134A 1W Control A1.ics] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		//run("Bio-Formats Importer", "open=" + list[i] + " color_mode=Default view=Hyperstack stack_order=XYCZT");
		}else{
		print(".ids");
		}
}
showMessage("Macro is finished");
