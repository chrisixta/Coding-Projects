# Insurance Policy Benefit Simulation Using Geomtric Formulas
# Chris Ixtabalan
# Date: December 1, 2024
# This program simulates the expected benefit paid under a 5-year term life insurance policy.

#Import to generate random numbers for simulating probalistic events
import random
#Imported to enable concurrent executed of code, allowing simulations to run in parallel
import threading

########################################################Expected Benefit Using Simulation##############################
#Class used to reresent an individual under the a 5-year term life insurance policy
class PolicyHolder:
   #Used to represent a policyholder
    def __init__(self, policy_id):
        self.policy_id = policy_id #Their ID
        self.benefit = 0 #Their starting benefit

    #Simulates life of policyholder   
    def simulate_life(self):
        probability_of_death = 0.05  # 5% chance of death each year
        for year in range(1, 6):  # Years 1 to 5
            #Generates random number 0-1, if number is less than 5%, person dies in the year
            if random.random() < probability_of_death:
                self.benefit = 1000 * year  # Benefit increases by $1,000 each year
                break  # Policyholder dies; exit the loop

#Function: Allows multiple simulations at once: 
#Used to simulate benefits paid to policyholders using multiple threads
#Returns average/expected benefit
def simulate_policies_threaded(num_simulations, num_threads=4):
    total_benefit = 0 #Total sum of all benefits for all policyholders
    benefits = [] #List to store individual beneftis of each policyholder
    lock = threading.Lock()  # Lock: To make sure threadts don't interfere with each other

    #Worker function that will be runned in each thread
    def worker(simulations_per_thread, thread_id):
        nonlocal total_benefit, benefits #Allows variable modifcation from outer function
        thread_benefit = 0 #Total benefit for each specific thread
        thread_benefits = [] #Lists of each benefit

        #Ran for each simulation
        for i in range(simulations_per_thread):
            policyholder = PolicyHolder(f"Policy_{thread_id}_{i}") #Creates ID
            policyholder.simulate_life() #Simulate life of policyholder
            thread_benefit += policyholder.benefit #Add policyholder's benefit to thread's total benefit
            thread_benefits.append(policyholder.benefit) #Then stores it into the thread list
        with lock:
            total_benefit += thread_benefit #Adds a threads benefit to overall total benefit
            benefits.extend(thread_benefits) #Same thing but to overall list

    simulations_per_thread = num_simulations // num_threads #Divides total simulation evenely by threads
    threads = [] #List to store all threads

    #Creates and start threads
    for thread_id in range(num_threads):
        t = threading.Thread(target=worker, args=(simulations_per_thread, thread_id)) #Creates thread
        threads.append(t) #Add thread to list of threads
        t.start() #Starts thread

    # Wait for all threads to complete
    for t in threads:
        t.join() #Waits until thread "t" finishes

    #Calculates average beneftt
    expected_benefit = total_benefit / num_simulations
    #Returns all individuals outputs
    return expected_benefit, benefits

############################################Expected Benefit Using Math Concepts##########################
#Geometric Formula
#Gives expeced benefit
def calculate_analytical_expected_benefit():
    probability_of_death = 0.05
    expected_benefit = 0
    for year in range(1, 6):  # Years 1 to 5
        benefit = 1000 * year
        # Calculate the probability of dying in a specific year
        prob = (1 - probability_of_death) ** (year - 1) * probability_of_death
        expected_benefit += benefit * prob  # Sum up the expected benefits
    return expected_benefit

##########################################################Main######################################################
def main():
    try:
        num_simulations = 100000  # Number of simulations
        #Calculate using simulation with threads
        expected_benefit_simulation, benefits = simulate_policies_threaded(num_simulations)
        #Calculate using Geometric Distribution
        expected_benefit_analytical = calculate_analytical_expected_benefit()

        #########################Results#####################
        print(f"Expected Benefit Using Math Concepts: ${expected_benefit_analytical:.2f}")
        print(f"Expected Benefit Using Simulations: ${expected_benefit_simulation:.2f}")

        # Additional analysis using the benefits list
        # Calculate variance and standard deviation
        mean = expected_benefit_simulation
        variance = sum((x - mean) ** 2 for x in benefits) / num_simulations
        std_dev = variance ** 0.5
        print(f"Simulated Variance: ${variance:.2f}")
        print(f"Simulated Standard Deviation: ${std_dev:.2f}")
        ####################################################
    #Exception Handling
    except Exception as e:
        print("An error occurred during the simulation.")
        print("Error message:", str(e))

if __name__ == "__main__":
    main()
