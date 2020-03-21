%Split labels into macro and micro activities for each data file
labels = readtable('/Users/swapnilsayansaha/OneDrive/UCLA Winter 2020 Quarter/C247/course project/train/labels.txt','Delimiter',' ','ReadVariableNames',0);
lenTable = size(labels);
labelTable = table('Size',[lenTable(1,1) 3],'VariableTypes',{'string','string','string'},'VariableNames',{'fileID','macro','micro'});
for i=1:lenTable(1,1)
    curStr = split(cell2mat(table2array(labels(i,1))),',',3);
    labelTable(i,1) = curStr(1,1);
    labelTable(i,2) = curStr(1,2);
    str = strjoin(curStr(1,3:length(curStr)));
    str = regexprep(str, ' ', ',');
    labelTable(i,3) = cellstr(str);      
end
clearvars -except labelTable lenTable dest
writetable(labelTable,'LabelTable.csv'); %save labels as CSV file