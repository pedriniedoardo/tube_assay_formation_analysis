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
	run("Create Selection");
	run("Measure");
}
out_path = dir1 +"length_skeleton" +".csv";
saveAs("Results", out_path);
showMessage("Macro is finished");
