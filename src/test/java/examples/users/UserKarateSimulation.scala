package examples.users

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._


class UserKarateSimulation extends Simulation {

  MockUtils.startServer()
  val rightResponse = scenario("rightResponse").exec(karateFeature("classpath:examples/users/xml.feature"))
  setUp(
    rightResponse.inject(rampUsers(10) during (10 seconds)),
  )

}