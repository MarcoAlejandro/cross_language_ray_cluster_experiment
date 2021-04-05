package org.example.application

import org.apache.spark.{SparkConf, SparkContext}

import scala.math.random

class PiSpark {
  def computePi(_slices: Int): Double = {
    val conf = new SparkConf().setAppName("SOME APP NAME").setMaster("local[2]").set("spark.executor.memory","1g");
    val spark = new SparkContext(conf)
    val slices = _slices
    val n = math.min(100000L * slices, Int.MaxValue).toInt // avoid overflow
    val count = spark.parallelize(1 until n, slices).map { i =>
      val x = random * 2 - 1
      val y = random * 2 - 1
      if (x*x + y*y < 1) 1 else 0
    }.reduce(_ + _)
    spark.stop()
    4.0 * count / n
  }
}
