% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'C:\Users\Tejas\Documents\psychfmri\Psych891fMRI\final_project_job_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
