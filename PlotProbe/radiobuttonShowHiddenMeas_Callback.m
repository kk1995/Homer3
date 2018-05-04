function radiobuttonShowHiddenMeas_Callback(hObject,handles)
global plotprobe

global hmr

currElem = hmr.currElem;
guiMain = hmr.guiMain;
plotprobe = hmr.plotprobe;

bit1 = get(hObject,'value');
plotprobe.hidMeasShow = bit1;
bit0 = plotprobe.tMarkShow;

h = plotprobe.objs.Data.h;

procResult  = currElem.procElem.procResult;
SD          = currElem.procElem.SD;

datatype    = guiMain.datatype;
buttonVals  = guiMain.buttonVals;

if currElem.procType==1
    condition  = guiMain.condition;
elseif currElem.procType==2
    condition = find(currElem.procElem.CondSubj2Group == guiMain.condition);
elseif currElem.procType==3
    condition  = find(currElem.procElem.CondRun2Group == guiMain.condition);
end

if datatype == buttonVals.OD_HRF
    y = procResult.dodAvg(:, :, condition);
elseif datatype == buttonVals.CONC_HRF
    y = procResult.dcAvg(:, :, :, condition);
end

guiSettings = 2*bit1 + bit0;
showHiddenObjs(guiSettings,SD,y,h);
