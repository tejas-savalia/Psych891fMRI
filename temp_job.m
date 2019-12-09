parent_directory = uigetdir('','Select Parent directory');
subject_list = ['sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15'; 'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'];

for sub = 1:26
    for run = 1:2
        for slice = 1:146
            c_array{sub}.run{run}.slices{slice, 1} = char(strcat(parent_directory, '\', subject_list(sub, :), '\func\', subject_list(sub, :), '_task-flanker_run-', string(run), '_bold.nii,', string(slice)));
            %c_array{sub * run, slice, 1} = char(strcat(parent_directory, '\', subject_list(sub, :), '\func\', subject_list(2), '_task-flanker_run-', string(run), '_bold.nii,', string(slice))); 
        end
    %matlabbatch{sub}.spm.temporal.st.scans = c_array{sub};
    end
    sub
    matlabbatch{1}.spm.temporal.st.scans = {c_array{sub}.run{1}.slices c_array{sub}.run{1}.slices};
    matlabbatch{1}.spm.temporal.st.nslices = 40;
    matlabbatch{1}.spm.temporal.st.tr = 2;
    matlabbatch{1}.spm.temporal.st.ta = 1.95;
    matlabbatch{1}.spm.temporal.st.so = [2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39];
    matlabbatch{1}.spm.temporal.st.refslice = 1;
    matlabbatch{1}.spm.temporal.st.prefix = 'a';
    
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep;
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).tname = 'Session';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).tgt_spec{1}(1).value = 'image';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).sname = 'Slice Timing: Slice Timing Corr. Images (Sess 1)';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1).src_output = substruct('()',{1}, '.','files');
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1) = cfg_dep;
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).tname = 'Session';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).tgt_spec{1}(1).value = 'image';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).sname = 'Slice Timing: Slice Timing Corr. Images (Sess 2)';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1).src_output = substruct('()',{2}, '.','files');
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 2;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1) = cfg_dep;
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).tname = 'Reference Image';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(1).value = 'image';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).sname = 'Realign: Estimate & Reslice: Mean Image';
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{3}.spm.spatial.coreg.estimate.ref(1).src_output = substruct('.','rmean');
    matlabbatch{3}.spm.spatial.coreg.estimate.source = {char(strcat(parent_directory, '\', subject_list(sub, :), '\anat\', subject_list(sub, :), '_T1w.nii,1'))};
    %matlabbatch{3}.spm.spatial.coreg.estimate.source = {'C:\Users\Tejas\Documents\psychfmri\Psych891fMRI\FinalProject\sub-01\anat\sub-01_T1w.nii,1'};
    matlabbatch{3}.spm.spatial.coreg.estimate.other = {''};
    matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
    matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
    matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
    matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
    matlabbatch{4}.spm.spatial.preproc.data(1) = cfg_dep;
    matlabbatch{4}.spm.spatial.preproc.data(1).tname = 'Data';
    matlabbatch{4}.spm.spatial.preproc.data(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{4}.spm.spatial.preproc.data(1).tgt_spec{1}(1).value = 'image';
    matlabbatch{4}.spm.spatial.preproc.data(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{4}.spm.spatial.preproc.data(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{4}.spm.spatial.preproc.data(1).sname = 'Coregister: Estimate: Coregistered Images';
    matlabbatch{4}.spm.spatial.preproc.data(1).src_exbranch = substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{4}.spm.spatial.preproc.data(1).src_output = substruct('.','cfiles');
    matlabbatch{4}.spm.spatial.preproc.output.GM = [0 0 1];
    matlabbatch{4}.spm.spatial.preproc.output.WM = [0 0 1];
    matlabbatch{4}.spm.spatial.preproc.output.CSF = [0 0 0];
    matlabbatch{4}.spm.spatial.preproc.output.biascor = 1;
    matlabbatch{4}.spm.spatial.preproc.output.cleanup = 0;
    matlabbatch{4}.spm.spatial.preproc.opts.tpm = {
                                                   'D:\Software\spm8\tpm\grey.nii'
                                                   'D:\Software\spm8\tpm\white.nii'
                                                   'D:\Software\spm8\tpm\csf.nii'
                                                   };
    matlabbatch{4}.spm.spatial.preproc.opts.ngaus = [2
                                                     2
                                                     2
                                                     4];
    matlabbatch{4}.spm.spatial.preproc.opts.regtype = 'mni';
    matlabbatch{4}.spm.spatial.preproc.opts.warpreg = 1;
    matlabbatch{4}.spm.spatial.preproc.opts.warpco = 25;
    matlabbatch{4}.spm.spatial.preproc.opts.biasreg = 0.0001;
    matlabbatch{4}.spm.spatial.preproc.opts.biasfwhm = 60;
    matlabbatch{4}.spm.spatial.preproc.opts.samp = 3;
    matlabbatch{4}.spm.spatial.preproc.opts.msk = {''};
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1) = cfg_dep;
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).tname = 'Parameter File';
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(1).value = 'mat';
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).sname = 'Segment: Norm Params Subj->MNI';
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).src_exbranch = substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{5}.spm.spatial.normalise.write.subj.matname(1).src_output = substruct('()',{1}, '.','snfile', '()',{':'});
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep;
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).tname = 'Images to Write';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(1).value = 'image';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).sname = 'Realign: Estimate & Reslice: Realigned Images (Sess 1)';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1).src_output = substruct('.','sess', '()',{1}, '.','cfiles');
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep;
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).tname = 'Images to Write';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(1).name = 'filter';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(1).value = 'image';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(2).value = 'e';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).sname = 'Realign: Estimate & Reslice: Resliced Images (Sess 2)';
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2).src_output = substruct('.','sess', '()',{2}, '.','rfiles');
    matlabbatch{5}.spm.spatial.normalise.write.roptions.preserve = 0;
    matlabbatch{5}.spm.spatial.normalise.write.roptions.bb = [-78 -112 -50
                                                              78 76 85];
    matlabbatch{5}.spm.spatial.normalise.write.roptions.vox = [2 2 2];
    matlabbatch{5}.spm.spatial.normalise.write.roptions.interp = 1;
    matlabbatch{5}.spm.spatial.normalise.write.roptions.wrap = [0 0 0];
    matlabbatch{5}.spm.spatial.normalise.write.roptions.prefix = 'w';
    matlabbatch{6}.spm.spatial.smooth.data(1) = cfg_dep;
    matlabbatch{6}.spm.spatial.smooth.data(1).tname = 'Images to Smooth';
    matlabbatch{6}.spm.spatial.smooth.data(1).tgt_spec{1}(1).name = 'filter';
    matlabbatch{6}.spm.spatial.smooth.data(1).tgt_spec{1}(1).value = 'image';
    matlabbatch{6}.spm.spatial.smooth.data(1).tgt_spec{1}(2).name = 'strtype';
    matlabbatch{6}.spm.spatial.smooth.data(1).tgt_spec{1}(2).value = 'e';
    matlabbatch{6}.spm.spatial.smooth.data(1).sname = 'Normalise: Write: Normalised Images (Subj 1)';
    matlabbatch{6}.spm.spatial.smooth.data(1).src_exbranch = substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
    matlabbatch{6}.spm.spatial.smooth.data(1).src_output = substruct('()',{1}, '.','files');
    matlabbatch{6}.spm.spatial.smooth.fwhm = [8 8 8];
    matlabbatch{6}.spm.spatial.smooth.dtype = 0;
    matlabbatch{6}.spm.spatial.smooth.im = 0;
    matlabbatch{6}.spm.spatial.smooth.prefix = 's';

    spm_jobman('run', matlabbatch);
end



