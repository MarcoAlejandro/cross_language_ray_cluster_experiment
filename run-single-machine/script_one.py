"""
Ray driver calling ray.init() directly, without pre-existing ray runtime enabled. 
"""
import ray

ray.init(job_config=ray.job_config.JobConfig(code_search_path="../scala-pi.jar"))

pi_spark_class = ray.java_actor_class("org.example.application.PiSpark")

pi_spark = pi_spark_class.remote()
pi_spark_compute_ref = pi_spark.computePi.remote(5000)
print(f"Pi is: {ray.get(pi_spark_compute_ref)}")
