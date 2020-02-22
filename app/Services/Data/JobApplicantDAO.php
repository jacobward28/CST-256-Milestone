<?php

namespace App\Services\Data;

use App\Services\Utility\ILoggerService;
use App\Services\Utility\DatabaseException;
use PDO;

class JobListingDAO{
    
    //Field that stores the database connection used by all the functions in the class
    private $conn;
    private $logger;
    
    //Non-default constructor that takes a PDO connection as an argument
    public function __construct(PDO $connection, ILoggerService $logger){
        $this->conn = $connection;
        $this->logger = $logger;
    }
    
    /**
     * Gets all of the jobs a user has applied to from the database
     * @param int $userID The user ID of user whose applied jobs the function should get
     * @throws DatabaseException
     * @return array An array of IDs of all the jobs that the user has applied to
     */
    public function getAllJobs(int $userID){
        
        $this->logger->info("Entering JobApplicantDAO.getAllJobs()", [$userID]);
        
        try{
            $statement = $this->conn->prepare("SELECT * FROM JOBAPPLICANTS WHERE USERS_IDUSERS = :id");
            $statement->bindParam(':id', $userID);
            $statement->execute();
        } catch (\PDOException $e){
            $this->logger->error("Exception: ", ['message' => $e->getMessage()]);
            throw new DatabaseException("Database Exception: " . $e->getMessage(), 0, $e);
        }
        
        //Array to store all the jobs returned from the database
        $jobs = [];
        
        //Iterates over all results returned and adds them to the jobs array
        while($job = $statement->fetch(PDO::FETCH_ASSOC)){
            array_push($jobs, $job);
        }
        
        $this->logger->info("Exiting JobApplicantDAO.getAllJobs()");
        
        return $jobs;
    }
    
   
    }