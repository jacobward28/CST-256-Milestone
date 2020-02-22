<?php


namespace App\Http\Controllers;

use App\Services\Utility\ILoggerService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Models\JobModel;
use App\Services\Business\JobService;

class JobController extends Controller
{

    /**
     * Handles the user's viewing of a job
     * @param Request $request
     * @param ILoggerService $logger
     * @return \Illuminate\View\View|\Illuminate\Contracts\View\Factory
     */

    public function createJob(Request $request, ILoggerService $logger)
    {
        $logger->info("Entering JobController.createJob()");
        
        // Validates the user's input against pre-defined rules
        $this->validateForm($request);
        
        try {

            // Takes user input from register form and uses it to make a new jobmodel object with an id of 0
            $job = new JobModel(0, $request->input('title'), $request->input('company'), $request->input('state'), $request->input('city'), $request->input('description'));

            // Creates instance of job service
            $jobService = new JobService();

            // Stores the result of the function call
            $result = $jobService->newJob($job, $logger);
            
            $logger->info("Exiting JobController.createJob() with a result of ", $result);

            //Returns the user to the job admin page
            return view('jobAdmin')->with(['results' => $jobService->getAllJobs($logger)]);
        } catch (\Exception $e) {
            $logger->error("Exception occured in JobController.createJob(): " . $e->getMessage());
            $data = ['error_message' => $e->getMessage()];
            return view('error')->with($data);
        }
    }

    // Contains the rules for validating the job creation
    private function validateForm(Request $request)
    {
        $rules = [
            'title' => 'Required | Between:4,20 | unique:mysql.JOBS,TITLE',
            'company' => 'Required | Between:1,45',
            'state' => 'Required | Between:1,20',
            'city' => 'Required | Between:1,20',
            'description' => 'Required | Between:1,65535'
        ];
        
        $this->validate($request, $rules);
    }
    
    
}
