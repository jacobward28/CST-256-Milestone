<?php


namespace App\Services\Utility;

use App\Services\Business\UserService;
use App\Services\Business\AddressService;
use App\Services\Business\UserInfoService;
use App\Services\Business\EducationService;
use App\Services\Business\ExperienceService;
use App\Services\Business\SkillService;
use App\Services\Business\JobListingService;
use App\Services\Business\JobService;

class ViewData{

    /**
     * Gets all of the data necessary to the user's profile view
     * @param int $userID the user ID of the user profile to be viewed
     * @param ILoggerService $logger
     * @return array [] Associative array of all the information needed to view the user's profile
     * @throws DatabaseException
     */
    public static function getProfileData($userID, ILoggerService $logger){
        
        $logger->info("Entering ViewData.getProfileData()", ['UserID' => $userID]);
        
        // Gets the user's info from the user table, address table, and the info table
        $userService = new UserService();
        $addressService = new AddressService();
        $infoService = new UserInfoService();
        $educationService = new EducationService();
        $experienceService = new ExperienceService();
        $skillService = new SkillService();
        $listingService = new JobListingService();
        $jobService = new JobService();
        
        // Stores the results for the user from all of the tables accessed
        $user = $userService->findByID($userID, $logger);
        $infoResults = $infoService->findByUserID($userID, $logger);
        $addressResults = $addressService->findByUserID($userID, $logger);
        $educationResults = $educationService->findByID($userID, $logger);
        $experienceResults = $experienceService->findByID($userID, $logger);
        $skillResults = $skillService->findByID($userID, $logger);
        $jobResults = $listingService->getAllJobs($logger);
        
        $appliedJobs = [];
        
        foreach($jobResults as $job){
            array_push($appliedJobs, $jobService->getJob($job['IDJOBS'], $logger)['job']);
        }
        
        // Stores all of the needed retrieved data in an associative array to be passed to the user profile view for display
        $data = [
            'ID' => $userID,
            'user' => $user['user'],
            'info' => $infoResults['userInfo'],
            'address' => $addressResults['address'],
            'educations' => $educationResults['education'],
            'experiences' => $experienceResults['experience'],
            'skills' => $skillResults['skills'],
        ];
        
        $logger->info("Exiting ViewData.getProfileData()", ['data' => $data]);
        
        return $data;
    }
}