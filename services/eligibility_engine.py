class EligibilityEngine:
    @staticmethod
    def check_eligibility(candidate, job):
        """
        Candidate aur Job ke criteria ko match karke eligibility check karega.
        Candidate aur Job dictionaries ya objects hone chahiye.
        """
        # 1. Percentage Check
        if candidate['percentage'] < job['min_percentage']:
            return False, "Percentage criteria not met."
        
        # 2. Backlog Check
        if candidate['backlog_count'] > job['max_backlogs']:
            return False, "Backlog count exceeds maximum allowed."
            
        # 3. Technology Match Check
        if candidate['primary_tech'].lower() != job['required_tech'].lower():
            return False, "Technology stack does not match."
            
        # 4. Job Status Check
        if job['job_status'] != 'OPEN':
            return False, "Job is not open for applications."
            
        return True, "Candidate is eligible for this job."