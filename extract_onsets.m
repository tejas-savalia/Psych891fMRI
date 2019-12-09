dironset =  'FinalProject';

%subj = {'SubD'};
subj = {'sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15'; 'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'};

for isub = 1 : length(subj)
    sub_dironset =  fullfile(dironset, [subj{isub}, '\func']);
        % File to read
    fn_tsv_1 = fullfile(sub_dironset, [subj{isub},'_task-flanker_run-1_events.tsv']);
    % File to save the spec information
    fn_tsv_2 = fullfile(sub_dironset, [subj{isub},'_task-flanker_run-2_events.tsv']);
    % Scan the text file as string and numeric values
    tsv1_contents = tdfread(fn_tsv_1);
    tsv2_contents = tdfread(fn_tsv_2);
%    fid = fopen(fn_tsv_1);
    C = textscan(fid, '%d %d %f %s %d %f %s','Delimiter','\t','Headerlines',1);
    fclose(fid);

    % Onset times from the start of the run (in sec)
    moveonsettime = (C{3});


    for run = 1:6
        fn_mat = fullfile(dironset, strcat(subj{isub}, '_run_', num2str(run), '_run_spec.mat'));
        names = cell(1,4);
        onsets = cell(1,4);
        durations = cell(1,4);

        %Conditions in "names"
        %Onset times in "onsets"
        names{1} = 'A';
        onsets{1} = moveonsettime(strcmp(C{4},'A') & C{1} == run);
        durations{1} = 2.4;

        names{2} = 'B';
        onsets{2} = moveonsettime(strcmp(C{4},'B') & C{1} == run);
        durations{2} = 2.4;

        names{3} = 'C';
        onsets{3} = moveonsettime(strcmp(C{4},'C') & C{1} == run);
        durations{3} = 2.4;

        names{4} = 'Clicks';
        onsets{4} = moveonsettime(C{5}==1 & C{1} == run) + 4.8 + C{6}(C{5} == 1 & C{1} == run);
        durations{4} = 0;

        % Save the spec information, which is to be loaded in an spm job
        save(fn_mat); 
    end
end