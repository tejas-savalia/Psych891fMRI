%get parent directory for all subjects
parent_directory = uigetdir('','Select Parent directory');
subject_list = ['sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15'; 'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'];

for sub = 1:26
    for run = 1:2
        for slice = 1:146
            c_array{sub}.run{run}.slices{slice, 1} = char(strcat(parent_directory, '\', subject_list(sub, :), '\func\', subject_list(2), '_task-flanker_run-', string(run), '_bold.nii,', string(slice)));
            %c_array{sub * run, slice, 1} = char(strcat(parent_directory, '\', subject_list(sub, :), '\func\', subject_list(2), '_task-flanker_run-', string(run), '_bold.nii,', string(slice))); 
        end
        %matlabbatch{sub}.spm.temporal.st.scans = c_array{sub};
    end
end
