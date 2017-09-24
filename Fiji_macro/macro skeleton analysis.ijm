dir = getDirectory("Choose source directory"); 
list = getFileList(dir); 
dir1 = getDirectory("Choose destination directory for csv files");
dir2 = getDirectory("Choose destination directory for longest_shortest");
//dir3 = getDirectory("Choose destination directory for tagged skeleton");

print(dir);
print(dir1);
print(dir2);
//print(dir3);
print(list.length);

for(i=0; i<list.length;i++){
	print(list[i]);
}
setBatchMode(true);
for(i=0; i<list.length;i++){
	l = lengthOf(list[i]);
	//name = substring(list[i],0,l-4);
	open(dir + list[i]);
	name2 = File.nameWithoutExtension;
	print(name2);
	run("Analyze Skeleton (2D/3D)", "prune=[shortest branch] calculate show display");
	//save the longest shortest
	selectWindow("Longest shortest paths");
	out_path2 = dir2 +"longest_shortest_"+name2+".csv";
	saveAs("Tiff", out_path2);
	//save the first image
	//selectWindow("Tagged skeleton");
	//out_path3 = dir3 +"tagged_skeleton_"+name2+".csv";
	//saveAs("Tiff", out_path3);
	selectWindow("Branch information");
	out_path1 = dir1 +"branch_info_"+name2+".csv";
	saveAs("Results", out_path1);
	run("Close");
	out_path = dir1 +"result_"+name2+".csv";
	saveAs("Results", out_path);
	run("Close");
	
}
showMessage("Macro is finished");