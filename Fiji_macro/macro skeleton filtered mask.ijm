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
	run("Skeletonize");
	name3 = substring(name2,0,l-16);
	out_path = dir1 + name3 +"_skeleton" +".tif";
	saveAs("tiff", out_path);
	print(out_path);
}
showMessage("Macro is finished");
