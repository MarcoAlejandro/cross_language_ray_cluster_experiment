
import ray

ray.init(
    address="auto",
    job_config=ray.job_config.JobConfig(code_search_path=['/home/ray/']),
)

pi_spark_class = ray.java_actor_class("org.example.application.PiSpark")

pi_spark = pi_spark_class.remote()
pi_spark_compute_ref = pi_spark.computePi.remote(5000)
print(f"Pi is: {ray.get(pi_spark_compute_ref)}")
