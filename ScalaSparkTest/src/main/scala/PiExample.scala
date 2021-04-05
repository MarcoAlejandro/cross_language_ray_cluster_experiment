package org.example.application

/* SimpleApp.scala */
import scala.math.random
import org.apache.spark._
import org.example.application.PiSpark

/** Computes an approximation to pi */
object PiExample {
  def main(args: Array[String]) {
    val slices = if (args.length > 0) args(0).toInt else 2
    val piSpark = new PiSpark()
    println("Pi is roughly: " + piSpark.computePi(slices))
  }
}
