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
	//name = substring(list[i],0,l-4);
	open(dir + list[i]);
	//print(name);
	name2 = File.nameWithoutExtension;
	print(name2);
	//remember to not include holes
	run("Analyze Particles...", "size=100-Infinity pixel circularity=0.00-0.45 show=Masks");
	out_path = dir1 + name2 +"_filter" +".tif";
	saveAs("tiff", out_path);
}
showMessage("Macro is finished");
