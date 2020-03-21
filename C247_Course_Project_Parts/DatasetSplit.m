%split dataset intelligently into training and validaion set.

splitratio = 0.7;
labelTable = readtable('LabelTable.csv');
labelTable = sortrows(labelTable,1);
sub1Table = labelTable(1:80,:);
sub2Table = labelTable(81:185,:);
sub3Table = labelTable(186:end,:);
a(randperm(80)',:) = sub1Table(:,:);
b(randperm(105)',:) = sub2Table(:,:);
c(randperm(103)',:) = sub3Table(:,:);
scount = 0;
fscount = 0;
ccount = 0;
sub1 = table;
sub2 = table;
sub3 = table;
%sub1
ca = find(strcmp(a.macro, 'cereal'));
fsa = find(strcmp(a.macro, 'fruitsalad'));
sa = find(strcmp(a.macro, 'sandwich'));
cb = find(strcmp(b.macro, 'cereal'));
fsb = find(strcmp(b.macro, 'fruitsalad'));
sb = find(strcmp(b.macro, 'sandwich'));
cc = find(strcmp(c.macro, 'cereal'));
fsc = find(strcmp(c.macro, 'fruitsalad'));
sc = find(strcmp(c.macro, 'sandwich'));
while scount<=floor(splitratio*size(sa,1))
    z = randperm(size(a,1),1);
    maclabel = a.macro{z,1};
    if(isequal(maclabel,'sandwich'))
        sub1(end+1,:) = a(z,:);
        a(z,:) = [];
        scount = scount+1;
    end
end
while ccount<=floor(splitratio*size(ca,1)) 
    z = randperm(size(a,1),1);
    maclabel = a.macro{z,1};
    if(isequal(maclabel,'cereal'))
        sub1(end+1,:) = a(z,:);
        a(z,:) = [];
        ccount = ccount+1;
    end
end
while fscount<=floor(splitratio*size(fsa,1)) 
    z = randperm(size(a,1),1);
    maclabel = a.macro{z,1};
    if(isequal(maclabel,'fruitsalad'))
        sub1(end+1,:) = a(z,:);
        a(z,:) = [];
        fscount = fscount+1;
    end
end
scount = 0;
fscount = 0;
ccount = 0;
while scount<=floor(splitratio*size(sb,1))
    z = randperm(size(b,1),1);
    maclabel = b.macro{z,1};
    if(isequal(maclabel,'sandwich'))
        sub2(end+1,:) = b(z,:);
        b(z,:) = [];
        scount = scount+1;
    end
end
while ccount<=floor(splitratio*size(cb,1)) 
    z = randperm(size(b,1),1);
    maclabel = b.macro{z,1};
    if(isequal(maclabel,'cereal'))
        sub2(end+1,:) = b(z,:);
        b(z,:) = [];
        ccount = ccount+1;
    end
end
while fscount<=floor(splitratio*size(fsb,1)) 
    z = randperm(size(b,1),1);
    maclabel = b.macro{z,1};
    if(isequal(maclabel,'fruitsalad'))
        sub2(end+1,:) = b(z,:);
        b(z,:) = [];
        fscount = fscount+1;
    end
end
scount = 0;
fscount = 0;
ccount = 0;
while scount<=floor(splitratio*size(sc,1))
    z = randperm(size(c,1),1);
    maclabel = c.macro{z,1};
    if(isequal(maclabel,'sandwich'))
        sub3(end+1,:) = c(z,:);
        c(z,:) = [];
        scount = scount+1;
    end
end
while ccount<=floor(splitratio*size(cc,1)) 
    z = randperm(size(c,1),1);
    maclabel = c.macro{z,1};
    if(isequal(maclabel,'cereal'))
        sub3(end+1,:) = c(z,:);
        c(z,:) = [];
        ccount = ccount+1;
    end
end
while fscount<=floor(splitratio*size(fsc,1)) 
    z = randperm(size(c,1),1);
    maclabel = c.macro{z,1};
    if(isequal(maclabel,'fruitsalad'))
        sub3(end+1,:) = c(z,:);
        c(z,:) = [];
        fscount = fscount+1;
    end
end   
traindata = vertcat(sub1, sub2, sub3);
valdata = vertcat(a,b,c);
